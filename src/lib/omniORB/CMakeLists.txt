add_subdirectory(codesets)
add_subdirectory(connections)
add_subdirectory(dynamic)
add_subdirectory(orbcore)
add_subdirectory(ziop)
add_subdirectory(ziopdynamic)

if (${Python_VERSION_MAJOR} EQUAL 2)
    install(DIRECTORY
            ${CMAKE_CURRENT_SOURCE_DIR}/python/
            DESTINATION ${PYTHON_SITE}
            FILES_MATCHING PATTERN "*.py")
else ()
    install(DIRECTORY
            ${CMAKE_CURRENT_SOURCE_DIR}/python3/
            DESTINATION ${PYTHON_SITE}
            FILES_MATCHING PATTERN "*.py")
endif ()