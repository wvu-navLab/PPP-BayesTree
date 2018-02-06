# Install script for directory: /home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam" TYPE FILE FILES "/home/rmw/Documents/git/PPP-BayesTree/trunk/gtsam/global_includes.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam" TYPE FILE FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/config.h"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/dllexport.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so.4.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/libgtsam.so.4.0.0"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/libgtsam.so.4"
    "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/libgtsam.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so.4.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so.4"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgtsam.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/3rdparty/metis/libmetis:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/3rdparty/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/base/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/geometry/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/inference/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/symbolic/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/linear/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/nonlinear/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/sam/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/sfm/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/slam/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/smart/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/navigation/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/gnssNavigation/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/configReader/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/robustModels/cmake_install.cmake")
  include("/home/rmw/Documents/git/PPP-BayesTree/trunk/build/gtsam/gpstk/cmake_install.cmake")

endif()

