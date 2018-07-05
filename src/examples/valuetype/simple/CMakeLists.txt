
ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/value.hh ${CMAKE_CURRENT_SOURCE_DIR}/valueSK.hh
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -C${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/value.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/Naming.idl omniidl omnicpp
        COMMENT "Processing Naming.idl..")


ADD_CUSTOM_TARGET(RunGeneratorXX DEPENDS
        omniidl
        omnicpp
        ${CMAKE_CURRENT_SOURCE_DIR}/value.hh
        ${CMAKE_CURRENT_SOURCE_DIR}/valueSK.hh
        COMMENT "Checking if re-generation is required")


add_executable(simple vclient.cc
        vcoloc.cc
        vserver.cc )


target_link_libraries(simple PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(simple PRIVATE __OMNIORB4__ _REENTRANT ${DEFAULT_LOGDIR} _WINSTATIC)
target_include_directories(simple PRIVATE . ${CMAKE_SOURCE_DIR}/include/include ${CMAKE_BINARY_DIR}/generated/lib/omniORB)
target_compile_options(simple PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(simple RunGeneratorXX)