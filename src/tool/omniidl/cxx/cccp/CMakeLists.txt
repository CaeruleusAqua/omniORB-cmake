set(OMNICPP_EXE_SRC
        cexp.c
        cccp.c
        config.c
        alloca.c)

if (WIN32)
    set(OMNICPP_EXE_SRC ${OMNICPP_EXE_SRC} index.c)
endif ()
add_executable(omnicpp ${OMNICPP_EXE_SRC})
target_include_directories(omnicpp PRIVATE ${CMAKE_SOURCE_DIR}/include)


install(TARGETS omnicpp
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)