set(OMNINAMES_EXE_SRC
        omniNames.cc
        NamingContext_i.cc
        log.cc
        omniNamesWin.cc)


if (OMNINAMES_LOG_DEFAULT_LOCATION)
    set(DEFAULT_LOGDIR DEFAULT_LOGDIR=${OMNINAMES_LOG_DEFAULT_LOCATION})
else ()
    if (WIN32)
        set(DEFAULT_LOGDIR DEFAULT_LOGDIR=\"C:\\\\TEMP\")
    else ()
        set(DEFAULT_LOGDIR DEFAULT_LOGDIR=\"/var/omniNames\")
    endif ()
endif ()


add_executable(omniNames ${OMNINAMES_EXE_SRC})
target_link_libraries(omniNames PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniNames PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(omniNames PRIVATE . ${PROJECT_SOURCE_DIR}/include/include ${PROJECT_BINARY_DIR}/generated/lib/omniORB)
target_compile_options(omniNames PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


install(TARGETS omniNames
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)