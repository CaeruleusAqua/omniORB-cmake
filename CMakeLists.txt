cmake_minimum_required(VERSION 3.12)
project(OmniORB VERSION 4.2.3)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_VERBOSE_MAKEFILE OFF)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)
set(OMNIORB_VERSION ${PROJECT_VERSION})
set(OMNIORB_VERSION_HEX "0x040202F1")
add_definitions(-D__OMNIORB4__)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


find_package(Python REQUIRED COMPONENTS Interpreter Development)
message(STATUS "Found Python Debug Library: ${Python_LIBRARY_DEBUG}")
message(STATUS "Found Python Release Library: ${Python_LIBRARY_RELEASE}")
INCLUDE(SelectLibraryConfigurations)
SELECT_LIBRARY_CONFIGURATIONS(Python)
message(STATUS "Found Python Libraries: ${Python_LIBRARY}")


find_package(Threads REQUIRED)

if (UNIX)
    SET(Python_EXECUTABLE ${Python_EXECUTABLE} CACHE STRING "Python Executable")
    execute_process(
            COMMAND "${Python_EXECUTABLE}" -c "if True:
    from distutils import sysconfig as sc
    print(sc.get_python_lib(prefix='', plat_specific=True))"
            OUTPUT_VARIABLE PYTHON_SITE
            OUTPUT_STRIP_TRAILING_WHITESPACE)
else ()
    string(REGEX REPLACE "\\\\" "/" python_site ${Python_SITELIB})
    set(PYTHON_SITE ${python_site} CACHE STRING "The Path where the py files are installed")
endif ()

message(STATUS "Found Python python_site: ${PYTHON_SITE}")

include(GNUInstallDirs)
include(codegen.cmake)
include(platform_checks.cmake)
include(package_config.cmake)


add_subdirectory(contrib)
add_subdirectory(src)


INSTALL(
        DIRECTORY ${PROJECT_SOURCE_DIR}/include/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING PATTERN "*.h*")


