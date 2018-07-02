set(OMNINAMES_EXE_SRC
    omniNames.cc
    NamingContext_i.cc
    log.cc
    omniNamesWin.cc)
add_executable(omniNames ${OMNINAMES_EXE_SRC})
target_link_libraries(omniNames PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniNames PRIVATE __OMNIORB4__ _REENTRANT DEFAULT_LOGDIR="/var/omninames")
target_include_directories(omniNames PRIVATE . ../../../stub ../../../include ${CMAKE_BINARY_DIR}/generated/lib/omniORB)
target_compile_options(omniNames PRIVATE -Wno-unused -fexceptions )


