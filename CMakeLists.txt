cmake_minimum_required(VERSION 3.0)
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


find_package(Threads REQUIRED)

if(WIN32)
    find_package(Python REQUIRED COMPONENTS Development)
else()
    find_package(Python REQUIRED COMPONENTS Interpreter Development)
endif()



SET(Python_VERSION_MAJOR ${Python_VERSION_MAJOR} CACHE STRING "Python Version 2/3")
SET(PYTHON_SITE ${PYTHON_SITE} CACHE STRING "Path to install python libs")
SET(Python_EXECUTABLE ${Python_EXECUTABLE} CACHE STRING "Python Executable")
SET(Python_LIBRARIES ${Python_LIBRARIES} CACHE STRING "Library Path")
SET(Python_ROOT_DIR ${Python_ROOT_DIR} CACHE STRING "Usually the python excecutable is in this path")



if (UNIX)
    execute_process(
            COMMAND "${Python_EXECUTABLE}" -c "if True:
    from distutils import sysconfig as sc
    print(sc.get_python_lib(prefix='', plat_specific=True))"
            OUTPUT_VARIABLE PYTHON_SITE
            OUTPUT_STRIP_TRAILING_WHITESPACE)
else ()
    if (PYTHON_SITE STREQUAL "")
        set(PYTHON_SITE Lib/site-packages)
    endif ()
endif ()


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


