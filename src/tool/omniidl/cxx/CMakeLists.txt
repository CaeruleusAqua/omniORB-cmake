add_subdirectory(cccp)

set(_OMNIIDLMODULE_SRC
        y.tab.cc
        lex.yy.cc
        idlerr.cc
        idlutil.cc
        idltype.cc
        ${PROJECT_SOURCE_DIR}/include/omniORB4/acconfig.h
        ${PROJECT_SOURCE_DIR}/include/omniORB4/CORBA_sysdep_auto.h
        ${PROJECT_SOURCE_DIR}/include/omniORB4/CORBA_sysdep.h
        ${PROJECT_SOURCE_DIR}/include/omniconfig.h
        ${PROJECT_SOURCE_DIR}/include/omniORB4/internal/tcpSocket.h
        idlrepoId.cc
        idlscope.cc
        idlexpr.cc
        idlast.cc
        idlvalidate.cc
        idldump.cc
        idlconfig.cc
        idlfixed.cc
        idlpython.cc)



if (WIN32)
    add_executable(omniidl ${_OMNIIDLMODULE_SRC})
    target_compile_definitions(omniidl PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> MSDOS OMNIIDL_EXECUTABLE IDLMODULE_VERSION="0x2630")
    target_include_directories(omniidl PRIVATE ${PYTHON_INCLUDE_DIR} . ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniidl PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
    target_compile_definitions(omniidl PUBLIC ${TARGET_DEFINITIONS})
    target_link_libraries(omniidl PRIVATE Python::Python)
    if (${Python_VERSION_MAJOR} EQUAL 3)
        if (WIN32 AND CMAKE_CXX_COMPILER_ID MATCHES "GNU")
            set_property(TARGET omniidl APPEND_STRING PROPERTY LINK_FLAGS "-municode ")
        endif ()
    endif ()

    install(TARGETS omniidl
            EXPORT ${PROJECT_NAME}Targets
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)
    if (MSVC)
        add_definitions(-D_CRT_SECURE_NO_WARNINGS
                        -DDONT_DECLARE_STRERROR)
    endif(MSVC)

else ()

    add_library(omniidl SHARED ${_OMNIIDLMODULE_SRC})
    target_compile_definitions(omniidl PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> IDLMODULE_VERSION="0x2630")
    target_include_directories(omniidl PRIVATE ${PYTHON_INCLUDE_DIR} . ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniidl PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
    target_compile_definitions(omniidl PUBLIC ${TARGET_DEFINITIONS})
    target_link_libraries(omniidl PRIVATE Python::Python)
    set_target_properties(omniidl PROPERTIES PREFIX "")
    set_target_properties(omniidl PROPERTIES OUTPUT_NAME "_omniidl")


    install(TARGETS omniidl EXPORT ${PROJECT_NAME}Targets LIBRARY DESTINATION ${PYTHON_SITE})

    set(prefix ${CMAKE_INSTALL_PREFIX})
    set(exec_prefix ${CMAKE_INSTALL_PREFIX})
    set(pythondir ${CMAKE_INSTALL_PREFIX}/${PYTHON_SITE})
    set(pyexecdir ${CMAKE_INSTALL_PREFIX}/${PYTHON_SITE})
    set(PYTHON ${Python_EXECUTABLE})

    if (${Python_VERSION_MAJOR} EQUAL 2)
        configure_file(${PROJECT_SOURCE_DIR}/src/tool/omniidl/python/scripts/omniidl.in ${PROJECT_BINARY_DIR}/bin/omniidl @ONLY)
    else ()
        configure_file(${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3/scripts/omniidl.in ${PROJECT_BINARY_DIR}/bin/omniidl @ONLY)
    endif ()

    install(FILES ${PROJECT_BINARY_DIR}/bin/omniidl DESTINATION bin
            PERMISSIONS WORLD_EXECUTE WORLD_READ OWNER_WRITE)

endif ()

INSTALL(DIRECTORY ${PROJECT_BINARY_DIR}/generated/lib/omniORB/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING PATTERN "*.h*")

if (${Python_VERSION_MAJOR} EQUAL 2)
    install(DIRECTORY
            ${PROJECT_SOURCE_DIR}/src/tool/omniidl/python/omniidl
            ${PROJECT_SOURCE_DIR}/src/tool/omniidl/python/omniidl_be
            DESTINATION ${PYTHON_SITE}
            FILES_MATCHING PATTERN "*.py")
else ()
    install(DIRECTORY
            ${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3/omniidl
            ${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3/omniidl_be
            DESTINATION ${PYTHON_SITE}
            FILES_MATCHING PATTERN "*.py")
endif ()

add_dependencies(omniidl omnicpp)






