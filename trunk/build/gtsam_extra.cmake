# Extra CMake definitions for GTSAM

set (GTSAM_VERSION_MAJOR 4)
set (GTSAM_VERSION_MINOR 0)
set (GTSAM_VERSION_PATCH 0)
set (GTSAM_VERSION_NUMERIC 40000)
set (GTSAM_VERSION_STRING "4.0.0")

set (GTSAM_USE_TBB 1)
set (GTSAM_DEFAULT_ALLOCATOR TBB)

if("1")
  list(APPEND GTSAM_INCLUDE_DIR "/usr/include")
endif()

# Append Eigen include path, set in top-level CMakeLists.txt to either
# system-eigen, or GTSAM eigen path
list(APPEND GTSAM_INCLUDE_DIR "/usr/local/include/gtsam/3rdparty/Eigen/")

if("0")
  list(APPEND GTSAM_INCLUDE_DIR "MKL_INCLUDE_DIR-NOTFOUND")
endif()
