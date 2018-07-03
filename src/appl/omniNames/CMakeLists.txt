set(OMNINAMES_EXE_SRC
        omniNames.cc
        NamingContext_i.cc
        log.cc
        omniNamesWin.cc)


if (OMNINAMES_LOG_DEFAULT_LOCATION)
    set(DEFAULT_LOGDIR DEFAULT_LOGDIR=${OMNINAMES_LOG_DEFAULT_LOCATION})
else ()
    if (WIN32)
        set(DEFAULT_LOGDIR DEFAULT_LOGDIR=\"C:\\TEMP\")
    else ()
        set(DEFAULT_LOGDIR DEFAULT_LOGDIR=\"/var/omniNames\")
    endif ()
endif ()


add_executable(omniNames ${OMNINAMES_EXE_SRC})
target_link_libraries(omniNames PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniNames PRIVATE __OMNIORB4__ _REENTRANT ${DEFAULT_LOGDIR})
target_include_directories(omniNames PRIVATE . ${CMAKE_SOURCE_DIR}/include/include ${CMAKE_BINARY_DIR}/generated/lib/omniORB)
target_compile_options(omniNames PRIVATE -Wno-unused -fexceptions)


