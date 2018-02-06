# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/symbolic" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicEliminationTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicISAM.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicFactor.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicConditional.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicBayesNet.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicFactorGraph.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicFactor-inst.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicBayesTree.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/symbolic/SymbolicJunctionTree.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/symbolic/tests/cmake_install.cmake")

endif()

