set(OMNICPP_EXE_SRC
        cexp.c
        cccp.c
        config.c
        alloca.c)

if (WIN32)
    set(OMNICPP_EXE_SRC ${OMNICPP_EXE_SRC} index.c)
endif ()

add_executable(omnicpp ${OMNICPP_EXE_SRC})
target_include_directories(omnicpp PRIVATE ${CMAKE_SOURCE_DIR}/include ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(omnicpp PRIVATE __WIN32__ _WIN32_WINNT=0x0501 __x86__ __NT__ __OSVERSION__=4 _CRT_SECURE_NO_DEPRECATE=1 HAVE_CONFIG_H)


install(TARGETS omnicpp
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)