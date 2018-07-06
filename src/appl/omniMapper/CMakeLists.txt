set(OMNIMAPPER_EXE_SRC
    omniMapper.cc)

set(CONFIG_FILE_ENV_VAR CONFIG_FILE_ENV_VAR=\"OMNIMAPPER_CONFIG\")
if(WIN32)
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"C:\\\\omniMapper.cfg\")
    else()
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"/etc/omniMapper.cfg\")
endif()

add_executable(omniMapper ${OMNIMAPPER_EXE_SRC})
target_link_libraries(omniMapper PRIVATE omnithread omniORB4 -NODEFAULTLIB:libcmt.lib -NODEFAULTLIB:libcmtd.lib)
target_compile_definitions(omniMapper PRIVATE -DCONFIG_FILE_ENV_VAR=\"OMNIMAPPER_CONFIG\" -DCONFIG_FILE_DEFAULT=\"C:\\omniMapper.cfg\" -D__WIN32__ -D_WIN32_WINNT=0x0501 -D__x86__ -D__NT__ -D__OSVERSION__=4 -D_CRT_SECURE_NO_DEPRECATE=1 )
target_include_directories(omniMapper PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include)
#target_compile_options(omniMapper PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )
target_compile_options(omniMapper PRIVATE /MDd /EHs /GS /GR /Zi)


install(TARGETS omniMapper
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)
