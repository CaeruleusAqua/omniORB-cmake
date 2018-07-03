set(OMNIMAPPER_EXE_SRC
    omniMapper.cc)

set(CONFIG_FILE_ENV_VAR CONFIG_FILE_ENV_VAR=\"OMNIMAPPER_CONFIG\")
if(WIN32)
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"C:\\omniMapper.cfg\")
    else()
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"/etc/omniMapper.cfg\")
endif()

add_executable(omniMapper ${OMNIMAPPER_EXE_SRC})
target_link_libraries(omniMapper PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniMapper PRIVATE __OMNIORB4__ _REENTRANT ${CONFIG_FILE_ENV_VAR} ${CONFIG_FILE_DEFAULT})
target_include_directories(omniMapper PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ../../../stub ../../../include)
target_compile_options(omniMapper PRIVATE -Wno-unused -fexceptions )


