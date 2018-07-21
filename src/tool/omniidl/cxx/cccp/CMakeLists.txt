set(OMNICPP_EXE_SRC
        cexp.c
        cccp.c
        config.c
        alloca.c)

if (WIN32)
    set(OMNICPP_EXE_SRC ${OMNICPP_EXE_SRC} index.c)
endif ()

add_executable(omnicpp ${OMNICPP_EXE_SRC})
target_include_directories(omnicpp PRIVATE ${PROJECT_SOURCE_DIR}/include ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(omnicpp PRIVATE HAVE_CONFIG_H)

install(TARGETS omnicpp
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION lib/static)