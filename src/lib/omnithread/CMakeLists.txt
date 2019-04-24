
set(OMNITHREAD_SRC threaddata.cc
        ${PROJECT_SOURCE_DIR}/include/omnithread.h)
if (UNIX)
    set(OMNITHREAD_SRC ${OMNITHREAD_SRC} posix.cc)
    set(OMNITHREAT_DEFS NoNanoSleep PthreadDraftVersion=10)
else ()
    set(OMNITHREAD_SRC ${OMNITHREAD_SRC} nt.cc)
    set(OMNITHREAT_DEFS_STATIC "_WINSTATIC")
    set(OMNITHREAT_DEFS_SHARED "_OMNITHREAD_DLL")
endif ()

add_library(omnithread_static STATIC ${OMNITHREAD_SRC})
target_compile_definitions(omnithread_static PUBLIC ${TARGET_DEFINITIONS})
target_compile_definitions(omnithread_static PRIVATE ${OMNITHREAT_DEFS} ${OMNITHREAT_DEFS_STATIC})
target_include_directories(omnithread_static PRIVATE . ${PROJECT_SOURCE_DIR}/include)
target_link_libraries(omnithread_static PUBLIC Threads::Threads)
target_compile_options(omnithread_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


add_library(omnithread SHARED ${OMNITHREAD_SRC})
target_compile_definitions(omnithread PUBLIC ${TARGET_DEFINITIONS})
target_link_libraries(omnithread PRIVATE Threads::Threads)
target_compile_definitions(omnithread PRIVATE ${OMNITHREAT_DEFS} ${OMNITHREAT_DEFS_SHARED})
target_include_directories(omnithread PRIVATE . ${PROJECT_SOURCE_DIR}/include)
target_link_libraries(omnithread PUBLIC Threads::Threads)
target_compile_options(omnithread PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})

install(TARGETS omnithread_static omnithread
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)
