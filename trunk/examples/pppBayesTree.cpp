/*
 * @file pppBayesTree.cpp
 * @brief Iterative GPS Range/Phase Estimator with collected data
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

// GPSTK
#include <gtsam/gpstk/MJD.hpp>
#include <gtsam/gpstk/PowerSum.hpp>
#include <gtsam/gpstk/Decimate.hpp>
#include <gtsam/gpstk/SolidTides.hpp>
#include <gtsam/gpstk/PoleTides.hpp>
#include <gtsam/gpstk/TropModel.hpp>
#include <gtsam/gpstk/BasicModel.hpp>
#include <gtsam/gpstk/CommonTime.hpp>
#include <gtsam/gpstk/PCSmoother.hpp>
#include <gtsam/gpstk/OceanLoading.hpp>
#include <gtsam/gpstk/CodeSmoother.hpp>
#include <gtsam/gpstk/SimpleFilter.hpp>
#include <gtsam/gpstk/MWCSDetector.hpp>
#include <gtsam/gpstk/SatArcMarker.hpp>
#include <gtsam/gpstk/DCBDataReader.hpp>
#include <gtsam/gpstk/ComputeWindUp.hpp>
#include <gtsam/gpstk/Rinex3NavData.hpp>
#include <gtsam/gpstk/GNSSconstants.hpp>
#include <gtsam/gpstk/ComputeLinear.hpp>
#include <gtsam/gpstk/GPSWeekSecond.hpp>
#include <gtsam/gpstk/LICSDetector2.hpp>
#include <gtsam/gpstk/DataStructures.hpp>
#include <gtsam/gpstk/RinexObsStream.hpp>
#include <gtsam/gpstk/Rinex3ObsStream.hpp>
#include <gtsam/gpstk/Rinex3NavStream.hpp>
#include <gtsam/gpstk/ComputeTropModel.hpp>
#include <gtsam/gpstk/SP3EphemerisStore.hpp>
#include <gtsam/gpstk/ComputeSatPCenter.hpp>
#include <gtsam/gpstk/EclipsedSatFilter.hpp>
#include <gtsam/gpstk/GPSEphemerisStore.hpp>
#include <gtsam/gpstk/CorrectCodeBiases.hpp>
#include <gtsam/gpstk/ComputeSatPCenter.hpp>
#include <gtsam/gpstk/RequireObservables.hpp>
#include <gtsam/gpstk/CorrectObservables.hpp>
#include <gtsam/gpstk/LinearCombinations.hpp>
#include <gtsam/gpstk/GravitationalDelay.hpp>
#include <gtsam/gpstk/PhaseCodeAlignment.hpp>


// BOOST
#include <boost/filesystem.hpp>
#include <boost/program_options.hpp>
#include <boost/serialization/export.hpp>
#include <boost/archive/binary_iarchive.hpp>
#include <boost/archive/binary_oarchive.hpp>

// STD
#include <chrono>
#include <iomanip>
#include <fstream>
#include <iostream>
#include <unistd.h>
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
        // define std out print color
        vector<int> prn_vec;
        vector<rnxData> data;
        const string red("\033[0;31m");
        const string green("\033[0;32m");
        string confFile, gnssFile, station, sp3File, p1p2File, p1c1File, antennaModel;
        string rnx_file, nav_file, sp3_file, out_file, antexFile;
        double xn, yn, zn, xp, yp, range, phase, rho, minElev, weightFactor;
        double antennaOffSetH, antennaOffSetE, antennaOffSetN;
        int startKey(0), currKey, startEpoch(0), svn, doy;
        int nThreads(-1), phase_break, break_count(0), nextKey, dec_int, itsBelowThree=0, count=0;
        bool printECEF, printENU, printAmb, printUpdateRate, first_ob(true), usingP1(false);

        cout.precision(12);

        po::options_description desc("Available options");
        desc.add_options()
                ("help,h", "Print help message")
                ("confFile,c", po::value<string>(&confFile)->default_value(""),
                "Input config file" )
                ("out", po::value<string>(&out_file)->default_value(""),
                "output file.")
                ("usingP1", "Are you using P1 instead of C1?");
        po::variables_map vm;
        po::store(po::command_line_parser(argc, argv).options(desc).run(), vm);
        po::notify(vm);

        ConfDataReader confReader;
        confReader.open(confFile);

        if (confFile.empty() ) {
                cout << red << "\n\n Currently, you need to provide a conf file \n"
                     << "\n\n"  << green << desc << endl;
        }

        while ( (station = confReader.getEachSection()) != "" )
        {
                // Fetch nominal station location [m]
                xn = confReader.fetchListValueAsDouble("nominalECEF",station);
                yn = confReader.fetchListValueAsDouble("nominalECEF",station);
                zn = confReader.fetchListValueAsDouble("nominalECEF",station);
                // day of year ( used for Niell Trop model)
                doy = confReader.getValueAsInt("DOY", station);
                // Elevation cut-off
                minElev = confReader.getValueAsDouble("minElev", station);
                // Code/carrier ratio
                weightFactor = confReader.getValueAsDouble("weightFactor", station);
                // Data file names
                gnssFile = confReader("rnxFile", station);
                sp3File = confReader("sp3File", station);
                p1p2File = confReader("p1p2", station);
                p1c1File = confReader("p1c1", station);
                // Print statements
                printENU = confReader.getValueAsBoolean("printENU", station);
                printAmb = confReader.getValueAsBoolean("printAmb", station);
                printECEF = confReader.getValueAsBoolean("printECEF", station);
                printUpdateRate = confReader.getValueAsBoolean("printUpdateRate", station);
        }

        usingP1 = (vm.count("usingP1")>0);

        Point3 nomXYZ(xn, yn, zn);
        Point3 prop_xyz = nomXYZ;


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
        double rw = 2.5;
        double rangeWeight = pow(rw,2);
        double phaseWeight = pow(rw*1/weightFactor,2);

        string value;

        nonBiasStates prior_nonBias = (gtsam::Vector(5) << 0.0, 0.0, 0.0, 0.0, 0.0).finished();

        phaseBias bias_state(Z_1x1);
        gnssStateVector phase_arc(Z_34x1);
        gnssStateVector bias_counter(Z_34x1);
        for (int i=1; i<34; i++) {bias_counter(i) = bias_counter(i-1) + 10000; }

        nonBiasStates initEst(Z_5x1);
        nonBiasStates between_nonBias_State(Z_5x1);

        Values initial_values;
        Values result;

        noiseModel::Diagonal::shared_ptr nonBias_InitNoise = noiseModel::Diagonal::Variances((gtsam::Vector(5) << 10.0, 10.0, 10.0, 3e8, 1e-1).finished());

        noiseModel::Diagonal::shared_ptr nonBias_ProcessNoise = noiseModel::Diagonal::Variances((gtsam::Vector(5) << 0.1, 0.1, 0.1, 3e6, 3e-5).finished());

        noiseModel::Diagonal::shared_ptr initNoise = noiseModel::Diagonal::Variances((gtsam::Vector(1) << 100).finished());

        string obs_path = findExampleDataFile(gnssFile);
        string p1p2_path = findExampleDataFile(p1p2File);
        string p1c1_path = findExampleDataFile(p1c1File);

        if ( obs_path.empty() )
        {
                cout << " Must pass in obs file !!! " << desc << endl;
                exit(1);
        }
        if ( sp3File.empty() )
        {
                cout << " Must pass in ephemeris file !!! " << desc << endl;
                exit(1);
        }
        // Declare a "SP3EphemerisStore" object to handle precise ephemeris
        SP3EphemerisStore SP3EphList;

        size_t pos = 0;
        string path, token;
        string delimiter = " ";
        while ((pos = sp3File.find(delimiter)) != string::npos) {
                path = findExampleDataFile(sp3File.substr(0,pos));
                SP3EphList.loadFile(path);
                sp3File.erase(0, pos + delimiter.length());
        }
        path = findExampleDataFile(sp3File);
        SP3EphList.loadFile(path);

        // Set flags to reject satellites with bad or absent positional
        // values or clocks
        SP3EphList.rejectBadPositions(true);
        SP3EphList.rejectBadClocks(true);

        // Create the input observation file stream
        Rinex3ObsStream rin(obs_path);

        // station nominal position
        Position nominalPos(xn, yn, zn);

        CorrectCodeBiases corrCode;
        corrCode.setDCBFile(p1p2_path, p1c1_path);

        if (!usingP1) {
                corrCode.setUsingC1(true);
        }


        // This is the GNSS data structure that will hold all the
        // GNSS-related information
        gnssRinex gRin;

        RequireObservables requireObs;
        requireObs.addRequiredType(TypeID::L1);
        requireObs.addRequiredType(TypeID::L2);

        SimpleFilter pObsFilter;
        pObsFilter.setFilteredType(TypeID::C1);

        if ( usingP1 )
        {
                requireObs.addRequiredType(TypeID::P1);
                pObsFilter.addFilteredType(TypeID::P1);
                requireObs.addRequiredType(TypeID::P2);
                pObsFilter.addFilteredType(TypeID::P2);
        }
        else
        {
                requireObs.addRequiredType(TypeID::C1);
                pObsFilter.addFilteredType(TypeID::C1);
                requireObs.addRequiredType(TypeID::P2);
                pObsFilter.addFilteredType(TypeID::P2);
        }

        // Declare a couple of basic modelers
        BasicModel basic(nominalPos, SP3EphList);
        basic.setMinElev(minElev);

        // Object to correct for SP3 Sat Phase-center offset
        ComputeSatPCenter svPcenter(SP3EphList, nominalPos);

        // Objects to mark cycle slips
        MWCSDetector markCSMW;  // Checks Merbourne-Wubbena cycle slip

        // object def several linear combinations
        LinearCombinations comb;

        // Object to compute linear combinations for cycle slip detection
        ComputeLinear linear1;
        if ( usingP1 )
        {
                linear1.addLinear(comb.pdeltaCombination);
                linear1.addLinear(comb.mwubbenaCombination);
        }
        else
        {
                linear1.addLinear(comb.pdeltaCombWithC1);
                linear1.addLinear(comb.mwubbenaCombWithC1);
        }
        linear1.addLinear(comb.ldeltaCombination);
        linear1.addLinear(comb.liCombination);

        ComputeLinear linear2;

        // Read if we should use C1 instead of P1
        if ( usingP1 ) { linear2.addLinear(comb.pcCombination); }
        else {  linear2.addLinear(comb.pcCombWithC1); }
        linear2.addLinear(comb.lcCombination);

        LICSDetector2 markCSLI2;       // Checks LI cycle slips

        // Object to keep track of satellite arcs
        SatArcMarker markArc;
        markArc.setDeleteUnstableSats(true);

        // Objects to compute gravitational delay effects
        GravitationalDelay grDelay(nominalPos);

        // Object to remove eclipsed satellites
        EclipsedSatFilter eclipsedSV;

        //Object to compute wind-up effect
        ComputeWindUp windup( SP3EphList, nominalPos );

        // Object to compute prefit-residuals
        ComputeLinear linear3(comb.pcPrefit);
        linear3.addLinear(comb.lcPrefit);

        TypeIDSet tset;
        tset.insert(TypeID::prefitC);
        tset.insert(TypeID::prefitL);

        // Declare a NeillTropModel object, setting the defaults
        NeillTropModel neillTM( nominalPos.getAltitude(),
                                nominalPos.getGeodeticLatitude(),
                                doy);

        // Objects to compute the tropospheric data
        ComputeTropModel computeTropo(neillTM);

        // initialize factor graph
        NonlinearFactorGraph *graph = new NonlinearFactorGraph();

        auto start = std::chrono::steady_clock::now();
        auto end = std::chrono::steady_clock::now();
        // Loop over all data epochs
        while(rin >> gRin)
        {
                TimeSystem sys;
                sys.fromString("GPS");
                CommonTime time(gRin.header.epoch);
                time.setTimeSystem(sys);
                GPSWeekSecond gpstime( time );

                // update nominal ECEF with propogated pos.
                NeillTropModel neillTM( nominalPos.getAltitude(),
                                        nominalPos.getGeodeticLatitude(),
                                        doy);
                try
                {
                        gRin >> requireObs // Check if required observations are present
                        >> pObsFilter // Filter out spurious data
                        >> linear1 // Compute linear combinations to detect CS
                        >> markCSLI2 // Mark cycle slips
                        >> markArc // Keep track of satellite arcs
                        >> basic // Compute the basic components of model
                        >> eclipsedSV // Remove satellites in eclipse
                        >> grDelay // Compute gravitational delay
                        >> svPcenter // Computer delta for sat. phase center
                        >> corrCode // Correct for differential code biases
                        >> windup // phase windup correction
                        >> computeTropo // neill trop function
                        >> linear2  // Compute ionosphere-free combinations
                        >> linear3;   // Compute prefit residuals
                }
                catch(Exception& e) {continue; }
                catch(...)
                {
                        cerr << "Unknown exception at epoch: " << time << endl;
                        continue;
                }

                // Iterate through the GNSS Data Structure
                satTypeValueMap::const_iterator it;
                typeValueMap::const_iterator itObs;
                if ( itsBelowThree > 0 )
                {
                        itsBelowThree = 0;
                        continue;
                }

                if (gRin.body.size() == 0) { continue; }

                // Loop over all observed sats at current epoch
                for (it = gRin.body.begin(); it!= gRin.body.end(); it++)
                {

                        start = std::chrono::steady_clock::now();
                        svn = ((*it).first).id;
                        double satX, satY, satZ;
                        satX = (*it).second.getValue(TypeID::satX);
                        satY = (*it).second.getValue(TypeID::satY);
                        satZ = (*it).second.getValue(TypeID::satZ);
                        Point3 satXYZ = Point3(satX,satY,satZ);
                        double range, rangeRes;
                        range = (*it).second.getValue(TypeID::PC);
                        rangeRes = (*it).second.getValue(TypeID::prefitC);
                        double phase, phaseRes;
                        phase = (*it).second.getValue(TypeID::LC);
                        phaseRes = (*it).second.getValue(TypeID::prefitL);
                        int phase_break;
                        phase_break = (*it).second.getValue(TypeID::satArc);

                        if (first_ob) {
                                startKey = count; first_ob=false;
                                graph->add(PriorFactor<nonBiasStates>(X(count), initEst,  nonBias_InitNoise));
                                initial_values.insert(X(count), initEst);
                        }

                        if (phase_arc[svn]!=phase_break)
                        {
                                bias_state[0] = phase - range;
                                if (count > startKey) { bias_counter[svn] = bias_counter[svn] +1; }
                                graph->add(PriorFactor<phaseBias>(G(bias_counter[svn]), bias_state,  initNoise));
                                initial_values.insert(G(bias_counter[svn]), bias_state);
                                phase_arc[svn] = phase_break;
                        }
                        // Generate pseudorange factor
                        PseudorangeFactor gpsRangeFactor(X(count), rangeRes, satXYZ, nomXYZ, diagNoise::Variances( (gtsam::Vector(1) << elDepWeight(satXYZ, nomXYZ, rangeWeight)).finished()));

                        graph->add(gpsRangeFactor);

                        // Generate phase factor
                        PhaseFactor gpsPhaseFactor(X(count), G(bias_counter[svn]), phaseRes, satXYZ, nomXYZ, diagNoise::Variances( (gtsam::Vector(1) << elDepWeight(satXYZ, nomXYZ, phaseWeight)).finished() ));

                        graph->add(gpsPhaseFactor);
                        prn_vec.push_back(svn);
                }
                if (count > startKey ) {
                        graph->add(BetweenFactor<nonBiasStates>(X(count), X(count-1), between_nonBias_State, nonBias_ProcessNoise));
                }
                isam.update(*graph, initial_values);
                result = isam.calculateEstimate();

                end = std::chrono::steady_clock::now();


                prior_nonBias = result.at<nonBiasStates>(X(count));
                Point3 delta_xyz = (gtsam::Vector(3) << prior_nonBias.x(), prior_nonBias.y(), prior_nonBias.z()).finished();
                Position deltaPos(prior_nonBias.x(), prior_nonBias.y(), prior_nonBias.z());
                prop_xyz = nomXYZ - delta_xyz;
                nominalPos -= deltaPos;

                if (printECEF) {
                        cout << "xyz " << gpstime.week << " " << gpstime.sow << " " << prop_xyz.x() << " " << prop_xyz.y() << " " << prop_xyz.z() << endl;
                }

                if (printENU) {
                        Point3 enu = xyz2enu(prop_xyz, nomXYZ);
                        cout << "enu " << gpstime.week << " " << gpstime.sow << " " << enu.x() << " " << enu.y() << " " << enu.z() << endl;
                }

                if (printAmb) {
                        for (int k=0; k<prn_vec.size(); k++) {
                                cout << "amb. " << gpstime.week << " " << gpstime.sow << " ";
                                cout << prn_vec[k] << " ";
                                cout << result.at<phaseBias>(G(bias_counter[prn_vec[k]])) << endl;
                        }
                }

                if (printUpdateRate) {
                        cout << "Elapsed time "
                             << std::chrono::duration_cast<std::chrono::microseconds>(end - start).count()
                             << " µs" << endl;
                }

                output_time = output_time +1;
                graph->resize(0);
                initial_values.clear();
                prn_vec.clear();
                count++;
                initial_values.insert(X(count), prior_nonBias);
        }
        isam.saveGraph("gnss.tree");
        return 0;
}
