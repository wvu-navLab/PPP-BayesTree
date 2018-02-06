# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/slam" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/JacobianFactorQR.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/EssentialMatrixConstraint.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/JacobianFactorQ.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/BearingFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/SmartFactorBase.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/EssentialMatrixFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/JacobianFactorSVD.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/dataset.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/lago.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/BetweenFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/RegularImplicitSchurFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/expressions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/PoseTranslationPrior.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/SmartProjectionFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/InitializePose3.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/AntiFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/OrientedPlane3Factor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/GeneralSFMFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/RotateFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/RangeFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/PoseRotationPrior.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/ProjectionFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/BoundingConstraint.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/ReferenceFrameFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/StereoFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/TriangulationFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/BearingRangeFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/PriorFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/slam/SmartProjectionPoseFactor.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/slam/tests/cmake_install.cmake")

endif()

