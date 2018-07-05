add_subdirectory(cccp)

set(_OMNIIDLMODULE_SRC
        y.tab.cc
        lex.yy.cc
        idlerr.cc
        idlutil.cc
        idltype.cc
        ${CMAKE_SOURCE_DIR}/include/omniORB4/acconfig.h
        ${CMAKE_SOURCE_DIR}/include/omniORB4/CORBA_sysdep_auto.h
        ${CMAKE_SOURCE_DIR}/include/omniORB4/CORBA_sysdep.h
        ${CMAKE_SOURCE_DIR}/include/omniconfig.h
        ${CMAKE_SOURCE_DIR}/include/omniORB4/internal/tcpSocket.h
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
    target_compile_definitions(omniidl PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> OMNIIDL_EXECUTABLE IDLMODULE_VERSION="0x2630")
    target_include_directories(omniidl PRIVATE ${PYTHON_INCLUDE_DIR} . ${CMAKE_SOURCE_DIR}/include)
    target_compile_options(omniidl PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
    target_link_libraries(omniidl PRIVATE Python::Python)
    if (${Python_VERSION_MAJOR} EQUAL 3)
        if(WIN32 AND CMAKE_CXX_COMPILER_ID MATCHES "GNU")
            set_property(TARGET omniidl APPEND_STRING PROPERTY LINK_FLAGS "-municode ")
        endif()
    endif ()

else ()
    add_library(omniidl SHARED ${_OMNIIDLMODULE_SRC})
    target_compile_definitions(omniidl PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> IDLMODULE_VERSION="0x2630")
    target_include_directories(omniidl PRIVATE ${PYTHON_INCLUDE_DIR} . ${CMAKE_SOURCE_DIR}/include)
    target_compile_options(omniidl PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
    target_link_libraries(omniidl PRIVATE Python::Python)
    set_target_properties(omniidl PROPERTIES PREFIX "")
    set_target_properties(omniidl PROPERTIES OUTPUT_NAME "_omniidl")
endif ()




install(TARGETS omniidl
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)

