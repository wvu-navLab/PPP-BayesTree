# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/nonlinear" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Values-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/LevenbergMarquardtParams.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ISAM2-impl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/WhiteNoiseFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ExpressionFactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Expression-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/DoglegOptimizerImpl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/GaussNewtonOptimizer.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Values.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearOptimizerParams.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/LevenbergMarquardtOptimizer.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearISAM.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ISAM2-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearEquality.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ExtendedKalmanFilter-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/nonlinearExceptions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ExpressionFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/AdaptAutoDiff.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/expressions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ExtendedKalmanFilter.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Marginals.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/DoglegOptimizer.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/ISAM2.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearConjugateGradientOptimizer.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/LinearContainerFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/factorTesting.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Symbol.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearOptimizer.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/Expression.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/NonlinearFactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/expressionTesting.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/nonlinear/internal" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/NonlinearOptimizerState.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/CallRecord.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/ExpressionNode.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/LevenbergMarquardtState.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/ExecutionTrace.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/nonlinear/internal/JacobianMap.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/nonlinear/tests/cmake_install.cmake")

endif()

