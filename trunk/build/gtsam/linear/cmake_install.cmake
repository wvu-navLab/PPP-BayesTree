# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/linear" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/NoiseModel.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/SubgraphSolver.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianJunctionTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/PCGSolver.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/JacobianFactor-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianBayesTree-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianBayesTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/VectorValues.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/RegularHessianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/iterative.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/Preconditioner.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/iterative-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/linearExceptions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianEliminationTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/SubgraphPreconditioner.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianFactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/HessianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/ConjugateGradientSolver.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/BinaryJacobianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/Errors.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianISAM.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/JacobianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/KalmanFilter.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/RegularJacobianFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/Sampler.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/HessianFactor-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/IterativeSolver.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/linearAlgorithms-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianConditional-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/Scatter.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianDensity.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianBayesNet.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/linear/GaussianConditional.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/linear/tests/cmake_install.cmake")

endif()

