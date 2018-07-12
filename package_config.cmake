set(INCLUDE_INSTALL_DIR include/)
set(LIB_INSTALL_DIR lib/)
set(SYSCONFIG_INSTALL_DIR etc/omniOrb/)
set(OMNI_CMAKE_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME}/)


include(CMakePackageConfigHelpers)

configure_package_config_file(cmake/OmniOrbConfig.cmake.in ${PROJECT_BINARY_DIR}/OmniOrbConfig.cmake
        INSTALL_DESTINATION ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME}
        PATH_VARS INCLUDE_INSTALL_DIR SYSCONFIG_INSTALL_DIR)

write_basic_package_version_file(${PROJECT_BINARY_DIR}/OmniOrbConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/OmniOrbConfig.cmake ${CMAKE_CURRENT_BINARY_DIR}/OmniOrbConfigVersion.cmake
        DESTINATION ${OMNI_CMAKE_INSTALL_DIR})


INSTALL(EXPORT ${PROJECT_NAME}Targets
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION ${OMNI_CMAKE_INSTALL_DIR}
        )