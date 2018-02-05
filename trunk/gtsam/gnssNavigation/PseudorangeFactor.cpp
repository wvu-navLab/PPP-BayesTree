/**
 *  @file   PseudorangeFactor.cpp
 *  @author Ryan Watson & Jason Gross
 *  @brief  Implementation file for pseudorange factor
 **/

#include "PseudorangeFactor.h"

using namespace std;

namespace gtsam {

//***************************************************************************
Vector PseudorangeFactor::evaluateError(const nonBiasStates& q,
                                        boost::optional<Matrix&> H) const {

        Point3 delta_xyz = (gtsam::Vector(3) << q.x(), q.y(), q.z()).finished();
        Vector h = obsMap(satXYZ_, nomXYZ_ - delta_xyz, 1);
        if (H) { (*H) = (Matrix(1,5) << h ).finished(); }
        double est = (h_.transpose() * q);
        return (Vector(1) << est - measured_ ).finished();
}
} // namespace
