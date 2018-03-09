/*

 * @file gnssOnlyISAM.cpp
 * @brief Iterative GPS Range/Phase Estimator
 * @author Ryan Watson & Jason Gross
 */

// GTSAM related includes.
#include <gtsam/slam/dataset.h>
#include <gtsam/nonlinear/ISAM2.h>
#include <gtsam/inference/Symbol.h>
#include <gtsam/slam/PriorFactor.h>
#include <gtsam/slam/BetweenFactor.h>
#include <gtsam/gnssNavigation/GnssData.h>
#include <gtsam/gnssNavigation/GnssTools.h>
#include <gtsam/gnssNavigation/PhaseFactor.h>
#include <gtsam/gnssNavigation/nonBiasStates.h>
#include <gtsam/configReader/ConfDataReader.hpp>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/gnssNavigation/PseudorangeFactor.h>
#include <gtsam/nonlinear/LevenbergMarquardtOptimizer.h>

// BOOST
#include <boost/filesystem.hpp>
#include <boost/program_options.hpp>
#include <boost/serialization/export.hpp>
#include <boost/archive/binary_iarchive.hpp>
#include <boost/archive/binary_oarchive.hpp>

#include <chrono>
#include <fstream>
#include <iostream>
#include <algorithm>

using namespace std;
using namespace gtsam;
using namespace gpstk;
using namespace boost;
using namespace std::chrono;
namespace NM = gtsam::noiseModel;
namespace po = boost::program_options;
typedef noiseModel::Diagonal diagNoise;

// Intel Threading Building Block
#ifdef GTSAM_USE_TBB
  #include <tbb/tbb.h>
  #undef max // TBB seems to include windows.h and we don't want these macros
  #undef min
#endif

using symbol_shorthand::X; // nonBiasStates ( dx, dy, dz, trop, cb )
using symbol_shorthand::G;   // bias states ( Phase Biases )

int main(int argc, char* argv[])
{
        int nThreads(-1), break_count(0);
        double xn, yn, zn, gpsErf;
        double east, north, vertical;
        string confFile, gnssFile;
        const string red("\033[0;31m");
        const string green("\033[0;32m");
        bool printBias(true), trop(true), printXYZ(true);
        Eigen::VectorXi prn_pre(1), prn_curr(1);
        Eigen::Matrix<double,96,1> gps = Eigen::Matrix<double,96,1>::Zero();
        Eigen::Matrix<double,96,1> gps_pre = Eigen::Matrix<double,96,1>::Zero();

        cout.precision(12);

        po::options_description desc("Available options");
        desc.add_options()
                ("help,h", "Print help message")
                ("confFile,c", po::value<string>(&confFile)->default_value(""),
                "Input config file" );

        po::variables_map vm;
        po::store(po::command_line_parser(argc, argv).options(desc).run(), vm);
        po::notify(vm);

        ConfDataReader confReader;
        confReader.open(confFile);
        string station;

        if (confFile.empty() ) {
                cout << red << "\n\n Currently, you need to provide a conf file \n"
                     << "\n\n"  << green << desc << endl;
        }

        while ( (station = confReader.getEachSection()) != "" )
        {
                xn = confReader.fetchListValueAsDouble("nominalECEF",station);
                yn = confReader.fetchListValueAsDouble("nominalECEF",station);
                zn = confReader.fetchListValueAsDouble("nominalECEF",station);
                east = confReader.fetchListValueAsDouble("nominalENU", station);
                north = confReader.fetchListValueAsDouble("nominalENU", station);
                vertical = -1*confReader.fetchListValueAsDouble("nominalENU", station);
                gpsErf = confReader.getValueAsDouble("productScale", station);
                gnssFile = confReader("dataFile", station);
        }

        gnssFile = findExampleDataFile(gnssFile);
        Point3 nomXYZ(xn, yn, zn);
        Point3 prop_xyz = nomXYZ;

        if ( gnssFile.empty() ) {
                cout << red << "\n\n GNSS data must be specified in the config \n"
                     << "\n\n" << green << desc << endl;
                exit(1);
        }

        #ifdef GTSAM_USE_TBB
        std::auto_ptr<tbb::task_scheduler_init> init;
        if(nThreads > 0) {
                init.reset(new tbb::task_scheduler_init(nThreads));
        }
        else
                cout << green << " \n\n Using threads for all processors" << endl;
        #else
        if(nThreads > 0) {
                cout << red <<" \n\n GTSAM is not compiled with TBB, so threading is"
                     << " disabled and the --threads option cannot be used."
                     << endl;
                exit(1);
        }
        #endif


        ISAM2DoglegParams doglegParams;
        ISAM2Params parameters;
        parameters.relinearizeThreshold = 0.1;
        parameters.relinearizeSkip = 100;
        ISAM2 isam(parameters);

        double output_time = 0.0;
        double rangeWeight = pow(2.5,2);
        double phaseWeight = pow(0.0025,2);

        ifstream file(gnssFile.c_str());
        string value;

        nonBiasStates prior_nonBias = (gtsam::Vector(5) << north, east, vertical, 3e6, 0.0).finished();

        biasStates bias_state(Z_1x1);
        gnssStateVector bias_counter(Z_34x1);
        for (int i=1; i<31; i++) {bias_counter(i) = bias_counter(i-1) + 1000; }
        nonBiasStates between_nonBias_State(Z_5x1);
        nonBiasStates prior_nonBias_State(Z_5x1);

        Values initial_values;
        Values result;
        int correction_count = 0;
        initial_values.insert(X(correction_count), prior_nonBias);

        noiseModel::Diagonal::shared_ptr nonBias_InitNoise = noiseModel::Diagonal::Sigmas((gtsam::Vector(5) << 1.0, 1.0, 1.0, 3e6, 3e-1).finished());

        noiseModel::Diagonal::shared_ptr nonBias_ProcessNoise = noiseModel::Diagonal::Sigmas((gtsam::Vector(5) << 5.0, 5.0, 5.0, 2e4, 100).finished());

        biasStates initNoise = (gtsam::Vector(1) << 5e-5).finished();
        diagNoise::shared_ptr biasInitNoise = diagNoise::Sigmas( initNoise );

        NonlinearFactorGraph *graph = new NonlinearFactorGraph();
        graph->add(PriorFactor<nonBiasStates>(X(correction_count), prior_nonBias,  nonBias_InitNoise));

        while ( file.good() ) {
                if (correction_count > 0 ) {
                        gps_pre = Eigen::Matrix<double,96,1>::Zero();
                        gps_pre = gps;
                        prn_pre = prn_curr;
                }

                getline(file, value, ',');
                gps = Eigen::Matrix<double,96,1>::Zero();
                for (int i=0; i<94; ++i) {
                        getline(file, value, ',');
                        gps(i) = atof(value.c_str());
                }
                if ( gps(0) == 0 ) { return 0; }

                prn_curr = getPRN(gps);
                int numSats = gps(0);
                int phase_break = gps(1);

                int count = 2;

                if ( phase_break || !((prn_pre - prn_curr).norm()==0) ) {
                        break_count++;
                        phase_break=0;

                        if (correction_count > 0) {
                                for (int i=0; i<numSats; i++) {
                                        phase_break = gps(count+1);
                                        if ( !checkPRN(prn_pre, prn_curr(i)) || phase_break) {
                                                bias_counter[prn_curr(i)] = bias_counter[prn_curr(i)] +1;
                                                bias_state[0] = gps(count+3)-gps(count+2);
                                                initial_values.insert(G(bias_counter[prn_curr(i)]), bias_state);
                                                graph->add(PriorFactor<biasStates>(G(bias_counter[prn_curr(i)]), bias_state, biasInitNoise));
                                        }
                                        count = count + 7;
                                }
                        }
                        else {
                                for (int i=0; i<numSats; i++) {
                                        bias_state[0] = gps(count+3)-gps(count+2);
                                        initial_values.insert(G(bias_counter[prn_curr(i)]), bias_state);
                                        graph->add(PriorFactor<biasStates>(G(bias_counter[prn_curr(i)]), bias_state, biasInitNoise));
                                        count = count+7;
                                }
                        }
                }

                if (correction_count > 1) {
                        graph->add(BetweenFactor<nonBiasStates>(X(correction_count), X(correction_count-1), between_nonBias_State, nonBias_ProcessNoise));
                }

                count = 2;
                for ( int j=0; j<numSats; j++ ) {
                        Point3 satXYZ = (gtsam::Vector(3) << gps(count+4),gps(count+5), gps(count+6)).finished();

                        double deltaRange = deltaObs(satXYZ, prop_xyz, gps(count+2));

                        double deltaPhase = deltaObs(satXYZ, prop_xyz, gps(count+3));

                        PseudorangeFactor gpsRangeFactor(X(correction_count), deltaRange, satXYZ, prop_xyz, diagNoise::Sigmas( (gtsam::Vector(1) << elDepWeight(satXYZ, prop_xyz, rangeWeight)).finished()));

                        PhaseFactor gpsPhaseFactor(X(correction_count), G(bias_counter[prn_curr(j)]),deltaPhase,satXYZ, prop_xyz, diagNoise::Sigmas( (gtsam::Vector(1) << elDepWeight(satXYZ, prop_xyz, phaseWeight)).finished() ));

                        graph->add(gpsRangeFactor);
                        graph->add(gpsPhaseFactor);

                        count = count + 7;
                }
                isam.update(*graph, initial_values);
                result = isam.calculateEstimate();

                prior_nonBias = result.at<nonBiasStates>(X(correction_count));
                Point3 delta_xyz = (gtsam::Vector(3) << prior_nonBias.x(), prior_nonBias.y(), prior_nonBias.z()).finished();
                prop_xyz = prop_xyz - delta_xyz;

                if (printXYZ) {
                        cout << "xyz " << prop_xyz.x() << " " << prop_xyz.y() << " " << prop_xyz.z() << endl;
                }

                if (printBias) {
                        cout << "gps ";
                        for (int k=0; k<numSats; k++) {
                                cout << result.at<biasStates>(G(bias_counter[prn_curr(k)])) << " ";
                        }
                        cout << endl;
                }

                output_time = output_time +1;
                graph->resize(0);
                initial_values.clear();

                correction_count++;
                initial_values.insert(X(correction_count), prior_nonBias);

        }
        return 0;
}
