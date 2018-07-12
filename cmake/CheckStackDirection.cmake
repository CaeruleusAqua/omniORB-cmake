#
# - Check if the system has the ANSI C files
# CHECK_STACK_DIRECTION
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
# RETURN_VALUE > 0 => grows toward higher addresses
# RETURN_VALUE < 0 => grows toward lower addresses
# RETURN_VALUE = 0 => direction of growth unknown */

macro(CHECK_STACK_DIRECTION RETURN_VALUE)
    if (NOT DEFINED ${RETURN_VALUE})
        if (CMAKE_REQUIRED_INCLUDES)
            set(CHECK_STACK_DIRECTION_C_INCLUDE_DIRS "-DINCLUDE_DIRECTORIES=${CMAKE_REQUIRED_INCLUDES}")
        else ()
            set(CHECK_STACK_DIRECTION_C_INCLUDE_DIRS)
        endif ()
        set(MACRO_CHECK_STACK_DIRECTION_FLAGS ${CMAKE_REQUIRED_FLAGS})

        message(STATUS "Check stack growing direction")


        try_run(CHECK_STACK_DIRECTION_result
                CHECK_STACK_DIRECTION_compile_result
                ${CMAKE_BINARY_DIR}
                ${CMAKE_CURRENT_SOURCE_DIR}/cmake/CheckStackDirection.c
                COMPILE_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS}
                CMAKE_FLAGS
                -DCOMPILE_DEFINITIONS:STRING=${MACRO_CHECK_STACK_DIRECTION_FLAGS}
                "${CHECK_STACK_DIRECTION_C_INCLUDE_DIRS}"
                RUN_OUTPUT_VARIABLE stack
                )

        if ("${stack}" STREQUAL "down")
            set(${RETURN_VALUE} "-1" CACHE INTERNAL "CHECK_STACK_DIRECTION")
            message(STATUS "Check for stack growing direction - downwards")
            file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
                    "Determining if the include file ${INCLUDE} "
                    "exists passed with the following output:\n"
                    "${stack}\n\n")
        elseif ("${stack}" STREQUAL "up")
            set(${RETURN_VALUE} "1" CACHE INTERNAL "CHECK_STACK_DIRECTION")
            message(STATUS "Check for stack growing direction - upwards")
            file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
                    "Determining the stack direction ${INCLUDE} "
                    "passed with the following output:\n"
                    "${stack}\n\n")
        else ()
            message(STATUS "Check for stack growing direction - unknown")
            file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
                    "Determining the stack direction ${INCLUDE} "
                    "failed with the following output:\n"
                    "${stack}\n\n")
        endif ()
    endif ()

endmacro()