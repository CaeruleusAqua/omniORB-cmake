cmake_minimum_required (VERSION 3.0)
project (OmniORB VERSION 4.2.2)

#set(CMAKE_TOOLCHAIN_FILE C:/Users/scholle/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_VERBOSE_MAKEFILE ON)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)
set(OMNIORB_VERSION ${PROJECT_VERSION})
set(OMNIORB_VERSION_HEX "0x040202F1")
add_definitions(-D__OMNIORB4__)


set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib/static)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)


#set(Python_ROOT_DIR C:/Users/scholle/Projects/vcpkg/installed/x86-windows/tools/python3)
#set(Python_ROOT_DIR "C:/msys64/mingw64")
find_package (Python REQUIRED COMPONENTS Interpreter Development)
find_package(Threads REQUIRED)

INSTALL (
        DIRECTORY ${PROJECT_SOURCE_DIR}/include/
        DESTINATION include
        FILES_MATCHING PATTERN "*.h*")

include(GNUInstallDirs)
include(codegen.cmake)
include(platform_checks.cmake)
include(package_config.cmake)
add_subdirectory(contrib)
add_subdirectory(src)

#message("----------------------${omniORB4_LIBRARIES}")