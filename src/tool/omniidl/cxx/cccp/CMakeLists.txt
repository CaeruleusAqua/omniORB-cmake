set(OMNICPP_EXE_SRC
    cexp.c
    cccp.c
    config.c
    alloca.c)
add_executable(omnicpp ${OMNICPP_EXE_SRC})
target_compile_definitions(omnicpp PRIVATE HAVE_CONFIG_H)
target_include_directories(omnicpp PRIVATE . . . ../../../../../include ../../../../../include)
target_compile_options(omnicpp PRIVATE -O )
