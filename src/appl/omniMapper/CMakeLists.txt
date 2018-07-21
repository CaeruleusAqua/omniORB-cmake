set(OMNIMAPPER_EXE_SRC
    omniMapper.cc)

set(CONFIG_FILE_ENV_VAR CONFIG_FILE_ENV_VAR=\"OMNIMAPPER_CONFIG\")
if(WIN32)
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"C:\\\\omniMapper.cfg\")
    else()
set(CONFIG_FILE_DEFAULT CONFIG_FILE_DEFAULT=\"/etc/omniMapper.cfg\")
endif()

add_executable(omniMapper ${OMNIMAPPER_EXE_SRC})
target_link_libraries(omniMapper PRIVATE omnithread omniORB4)
target_compile_definitions(omniMapper PRIVATE  ${CONFIG_FILE_ENV_VAR} ${CONFIG_FILE_DEFAULT})
target_include_directories(omniMapper PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB ${PROJECT_SOURCE_DIR}/include)
target_compile_options(omniMapper PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )

install(TARGETS omniMapper
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)
