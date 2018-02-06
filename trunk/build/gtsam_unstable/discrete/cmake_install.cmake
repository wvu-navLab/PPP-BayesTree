# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam_unstable/discrete" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/Domain.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/SingleValue.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/AllDiff.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/Scheduler.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/BinaryAllDiff.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/Constraint.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam_unstable/discrete/CSP.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam_unstable/discrete/tests/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam_unstable/discrete/examples/cmake_install.cmake")

endif()

