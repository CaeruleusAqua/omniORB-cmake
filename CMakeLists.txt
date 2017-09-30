cmake_minimum_required (VERSION 3.0)
project (OmniOrb)

set(CMAKE_CXX_STANDARD 98)

find_package(PythonLibs REQUIRED)
find_package(PythonInterp REQUIRED)
add_definitions(-D__OSVERSION__=2 -D__linux__ -D__x86_64__ -D__x86__)
add_subdirectory(src)
