# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/inference" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/ISAM.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/graph-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/FactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesTreeCliqueBase.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Factor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Conditional.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/VariableIndex-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Key.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/EliminateableFactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/ISAM-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/EliminationTree-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/inferenceExceptions.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesTreeCliqueBase-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/graph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/JunctionTree-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/FactorGraph-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Conditional-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/ClusterTree-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesNet-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/EliminationTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/inference-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Ordering.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/VariableSlots.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/LabeledSymbol.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/EliminateableFactorGraph-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesNet.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/JunctionTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/VariableIndex.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/Symbol.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/BayesTree-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/MetisIndex-inl.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/MetisIndex.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/inference/ClusterTree.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/inference/tests/cmake_install.cmake")

endif()

