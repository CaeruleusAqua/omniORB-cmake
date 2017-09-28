set(OMNINAMES_EXE_SRC
    omniNames.cc
    NamingContext_i.cc
    log.cc
    omniNamesWin.cc)
add_executable(omniNames ${OMNINAMES_EXE_SRC})
target_link_libraries(omniNames PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniNames PRIVATE __OMNIORB4__ _REENTRANT DEFAULT_LOGDIR="/var/omninames")
target_include_directories(omniNames PRIVATE . ../../../stub . . ../../../include ../../../include)
target_compile_options(omniNames PRIVATE -O2 -Wall -Wno-unused -fexceptions )


set(OMNINAMES_EXE_SRC
    omniNames.cc
    NamingContext_i.cc
    log.cc
    omniNamesWin.cc)
add_executable(omniNames ${OMNINAMES_EXE_SRC})
target_link_libraries(omniNames PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniNames PRIVATE __OMNIORB4__ _REENTRANT DEFAULT_LOGDIR="/var/omninames")
target_include_directories(omniNames PRIVATE . ../../../stub . . ../../../include ../../../include)
target_compile_options(omniNames PRIVATE -O2 -Wall -Wno-unused -fexceptions )


