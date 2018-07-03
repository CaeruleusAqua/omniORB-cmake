set(OMNICPP_EXE_SRC
        cexp.c
        cccp.c
        config.c
        alloca.c)

if (WIN32)
    set(OMNICPP_EXE_SRC ${OMNICPP_EXE_SRC} index.c)
endif ()
add_executable(omnicpp ${OMNICPP_EXE_SRC})
target_include_directories(omnicpp PRIVATE . . . ../../../../../include ../../../../../include)
target_compile_options(omnicpp PRIVATE -O)
