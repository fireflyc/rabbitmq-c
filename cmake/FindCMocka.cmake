# vim:set ts=2 sw=2 sts=2 et:
# Try to find the cmocka unit testing library.
# The module will set the following variables
#
# CMOCKA_FOUND - System has cmocka
# CMOCKA_INCLUDE_DIR - The cmocka include directory
# CMOCKA_LIBRARY - The library needed to use cmocka


find_package(PkgConfig QUIET)
if (PkgConfig_FOUND)
  pkg_search_module(PC_CMOCKA QUIET cmocka)
endif()

find_path(CMOCKA_INCLUDE_DIR
  NAMES cmocka.h
  HINTS
    ${PC_CMOCKA_INCLUDEDIR}
    ${PC_CMOCKA_INCLUDE_DIRS}
  DOC "Path containing cmocka.h include file"
)

find_library(CMOCKA_LIBRARY
  NAMES cmocka
  HINTS
    ${PC_CMOCKA_LIBRARYDIR}
    ${PC_CMOCKA_LIBRARY_DIRS}
  DOC "cmocka library path"
)

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(CMOCKA
  REQUIRED_VARS CMOCKA_INCLUDE_DIR CMOCKA_LIBRARY
  VERSION_VAR PC_CMOCKA_VERSION)

MARK_AS_ADVANCED(CMOCKA_INCLUDE_DIR CMOCKA_LIBRARY)
