cmake_minimum_required (VERSION 3.0)
project (OmniOrb VERSION 4.2.2)


#set(CMAKE_TOOLCHAIN_FILE C:/Users/scholle/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(CMAKE_CXX_STANDARD 98)
#set(CMAKE_VERBOSE_MAKEFILE ON)

set(PYTHON_EXECUTABLE "C:\\Python37\\python.exe")
set(CMAKE_TOOLCHAIN_FILE C:/Users/scholle/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(OMNIORB_VERSION ${PROJECT_VERSION})
set(OMNIORB_VERSION_HEX "0x040202F1")

find_package(PythonInterp REQUIRED)
find_package(PythonLibs REQUIRED)
find_package(Threads REQUIRED)
add_definitions(-D__WIN32__ -D_CRT_SECURE_NO_WARNINGS)
#set(COMPILE_FLAG_WNO_UNUSED -Wno-unused)
#set(COMPILE_FLAG_FEXCEPTIONS -fexceptions)
#set(COMPILE_FLAG_FPERMISSIVE -fpermissive)
#set(COMPILE_FLAG_WNO_WRITE_STRINGS -Wno-write-strings)




include(codegen.cmake)
include(platform_checks.cmake)

add_subdirectory(src)