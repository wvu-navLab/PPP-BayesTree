# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam_unstable/nonlinear" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/IncrementalFixedLagSmoother.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/ConcurrentIncrementalFilter.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/ConcurrentFilteringAndSmoothing.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/ConcurrentBatchFilter.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/BatchFixedLagSmoother.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/ConcurrentBatchSmoother.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/LinearizedFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/NonlinearClusterTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/FixedLagSmoother.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/nonlinear/ConcurrentIncrementalSmoother.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam_unstable/nonlinear/tests/cmake_install.cmake")

endif()

