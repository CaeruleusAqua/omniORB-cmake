cmake_minimum_required (VERSION 3.0)
project (OmniOrb VERSION 4.2.2)

#set(CMAKE_TOOLCHAIN_FILE C:/Users/scholle/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_VERBOSE_MAKEFILE ON)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)
set(OMNIORB_VERSION ${PROJECT_VERSION})
set(OMNIORB_VERSION_HEX "0x040202F1")
if(WIN32)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/static)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#set(Python_ROOT_DIR "C:/msys64/mingw64")
find_package (Python REQUIRED COMPONENTS Interpreter Development)
find_package(Threads REQUIRED)



add_definitions(-D__WIN32__ -D__x86__ -D__NT__ -D_WIN32_WINNT=0x0501 -D__OSVERSION__=4 -D_CRT_SECURE_NO_WARNINGS)


if (CMAKE_CXX_COMPILER_ID MATCHES "clang")
    # using Clang
elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    # using GCC
    set(COMPILE_FLAG_WNO_UNUSED -Wno-unused)
    set(COMPILE_FLAG_FEXCEPTIONS -fexceptions)
    set(COMPILE_FLAG_FPERMISSIVE -fpermissive)
    set(COMPILE_FLAG_WNO_WRITE_STRINGS -Wno-write-strings)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
    # using Intel C++
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    # using Visual Studio C++
endif()


include(codegen.cmake)
include(platform_checks.cmake)
add_subdirectory(src)