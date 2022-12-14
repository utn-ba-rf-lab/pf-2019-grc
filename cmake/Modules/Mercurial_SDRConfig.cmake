INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_MERCURIAL_SDR Mercurial_SDR)

FIND_PATH(
    MERCURIAL_SDR_INCLUDE_DIRS
    NAMES Mercurial_SDR/api.h
    HINTS $ENV{MERCURIAL_SDR_DIR}/include
        ${PC_MERCURIAL_SDR_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    MERCURIAL_SDR_LIBRARIES
    NAMES gnuradio-Mercurial_SDR
    HINTS $ENV{MERCURIAL_SDR_DIR}/lib
        ${PC_MERCURIAL_SDR_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/Mercurial_SDRTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MERCURIAL_SDR DEFAULT_MSG MERCURIAL_SDR_LIBRARIES MERCURIAL_SDR_INCLUDE_DIRS)
MARK_AS_ADVANCED(MERCURIAL_SDR_LIBRARIES MERCURIAL_SDR_INCLUDE_DIRS)
