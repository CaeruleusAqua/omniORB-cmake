#
# - Check if the system has the ANSI C files
# CHECK_HEADER_STDC
#
# The following variables may be set before calling this macro to
# modify the way the check is run:
#
#  CMAKE_REQUIRED_FLAGS = string of compile command line flags
#  CMAKE_REQUIRED_DEFINITIONS = list of macros to define (-DFOO=bar)
#  CMAKE_REQUIRED_INCLUDES = list of include directories
# Copyright (c) 2009, Michihiro NAKAJIMA
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

macro(CHECK_HEADER_STDC RETURN_VALUE)
    if (NOT DEFINED ${RETURN_VALUE})
        if (CMAKE_REQUIRED_INCLUDES)
            set(CHECK_HEADER_STDC_C_INCLUDE_DIRS "-DINCLUDE_DIRECTORIES=${CMAKE_REQUIRED_INCLUDES}")
        else()
            set(CHECK_HEADER_STDC_C_INCLUDE_DIRS)
        endif()
        set(MACRO_CHECK_HEADER_STDC_FLAGS ${CMAKE_REQUIRED_FLAGS})

        message(STATUS "Check for ANSI C header files")
        try_run(CHECK_HEADER_STDC_result
                CHECK_HEADER_STDC_compile_result
                ${CMAKE_BINARY_DIR}
                ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CheckHeaderSTDC.c
                COMPILE_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS}
                CMAKE_FLAGS
                -DCOMPILE_DEFINITIONS:STRING=${MACRO_CHECK_HEADER_STDC_FLAGS}
                "${CHECK_HEADER_STDC_C_INCLUDE_DIRS}"
                OUTPUT_VARIABLE OUTPUT)

        if(CHECK_HEADER_STDC_result EQUAL 0)
            message(STATUS "Check for ANSI C header files - found")
            set(${RETURN_VALUE} "1")
            file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
                    "Determining if the include file ${INCLUDE} "
                    "exists passed with the following output:\n"
                    "${OUTPUT}\n\n")
        else()
            message(STATUS "Check for ANSI C header files - not found")
            set(${RETURN_VALUE} "")
            file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
                    "Determining if the include file ${INCLUDE} "
                    "exists failed with the following output:\n"
                    "${OUTPUT}\n\n")
        endif()
    endif()
endmacro()