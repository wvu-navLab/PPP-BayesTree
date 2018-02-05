/**
 *  @file   PhaseFactor.cpp
 *  @author Ryan Watson & Jason Gross
 *  @brief  Implementation file for carrier-phase factor
 **/

#include <gtsam/gnssNavigation/PhaseFactor.h>

using namespace std;

namespace gtsam {
//***************************************************************************
Vector PhaseFactor::evaluateError(const nonBiasStates& q, const biasStates& g, boost::optional<Matrix&> H1, boost::optional<Matrix&> H2) const {

        Point3 delta_xyz = (gtsam::Vector(3) << q.x(), q.y(), q.z()).finished();
        Vector h = obsMap(satXYZ_, nomXYZ_ - delta_xyz, 1);
        Matrix gnssPartials = Z_1x1;

        if (H1) { (*H1) = (Matrix(1,5) << h ).finished(); }
        if (H2) {
                gnssPartials(0) = 1.0; // phase bias
                (*H2) = gnssPartials;
        }
        double est = (h.transpose() * q) + g[0];
        return (Vector(1) << est - measured_ ).finished();
}
}  //namespace
