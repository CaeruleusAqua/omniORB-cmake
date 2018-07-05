cmake_minimum_required (VERSION 3.0)
project (OmniOrb VERSION 4.2.2)


#set(CMAKE_TOOLCHAIN_FILE C:/Users/scholle/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake)

set(CMAKE_CXX_STANDARD 98)
#set(CMAKE_VERBOSE_MAKEFILE ON)

#set(CMAKE_CXX_FLAGS /MTd /EHs /RTC1 /GS /GR /Zi /nologo)
#set(Python_EXECUTABLE "H:\\Python37-32\\python.exe")
#set(Python_EXECUTABLE "C:\\Python37\\python.exe")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)

set(OMNIORB_VERSION ${PROJECT_VERSION})
set(OMNIORB_VERSION_HEX "0x040202F1")

#set(Python_ROOT_DIR "C:/msys64/mingw64")
find_package (Python REQUIRED COMPONENTS Interpreter Development)
message("--------------${Python_LIBRARY_DIRS}")
message("--------------${Python_RUNTIME_LIBRARY_DIRS}")
message("--------------${Python_EXECUTABLE}")
message("--------------${Python_VERSION_MAJOR}")


find_package(Threads REQUIRED)
add_definitions(-D__WIN32__ -D__x86__ -D__NT__ -D_WIN32_WINNT=0x0A00 -D__OSVERSION__=4 -D_CRT_SECURE_NO_WARNINGS)

set(COMPILE_FLAG_WNO_UNUSED -Wno-unused)
set(COMPILE_FLAG_FEXCEPTIONS -fexceptions)
set(COMPILE_FLAG_FPERMISSIVE -fpermissive)
set(COMPILE_FLAG_WNO_WRITE_STRINGS -Wno-write-strings)




include(codegen.cmake)
include(platform_checks.cmake)

add_subdirectory(src)