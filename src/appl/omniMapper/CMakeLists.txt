set(OMNIMAPPER_EXE_SRC
    omniMapper.cc)
add_executable(omniMapper ${OMNIMAPPER_EXE_SRC})
target_link_libraries(omniMapper PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniMapper PRIVATE __OMNIORB4__ _REENTRANT CONFIG_FILE_ENV_VAR="OMNIMAPPER_CONFIG" CONFIG_FILE_DEFAULT="/etc/omniMapper.cfg")
target_include_directories(omniMapper PRIVATE ../../../stub . . ../../../include ../../../include)
target_compile_options(omniMapper PRIVATE -Wno-unused -fexceptions )


