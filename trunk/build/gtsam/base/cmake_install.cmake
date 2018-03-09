# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/serializationTestHelpers.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/chartTesting.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/debug.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/FastMap.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/numericalDerivative.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/ProductLieGroup.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/serialization.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/FastVector.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Vector.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/LieVector.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/GenericValue.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Testable.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/FastDefaultAllocator.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/SymmetricBlockMatrix.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/treeTraversal-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/LieMatrix.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/FastList.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/ConcurrentMap.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Matrix.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/VectorSpace.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/timing.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/TestableAssertions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Manifold.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/VerticalBlockMatrix.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/DerivedValue.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/DSFVector.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Value.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/FastSet.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/LieScalar.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/testLie.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Lie.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/cholesky.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/lieProxies.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/Group.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/concepts.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/OptionalJacobian.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/types.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/ThreadsafeException.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base/treeTraversal" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/treeTraversal/statistics.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/treeTraversal/parallelTraversalTasks.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base/deprecated" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/deprecated/LieVector.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/deprecated/LieMatrix.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/base/deprecated/LieScalar.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/base/tests/cmake_install.cmake")

endif()

