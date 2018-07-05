
if (UNIX)
    set(OMNITHREAD_SRC posix.cc threaddata.cc)
    set(OMNITHREAT_DEFS NoNanoSleep PthreadDraftVersion=10)
else ()
    set(OMNITHREAD_SRC nt.cc threaddata.cc)
    set(OMNITHREAT_DEFS_STATIC "_WINSTATIC")
	set(OMNITHREAT_DEFS_SHARED "_OMNITHREAD_DLL")
endif ()


add_library(omnithread_static STATIC ${OMNITHREAD_SRC})
target_compile_definitions(omnithread_static PRIVATE _REENTRANT ${OMNITHREAT_DEFS} ${OMNITHREAT_DEFS_STATIC})
target_include_directories(omnithread_static PRIVATE . ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(omnithread_static PUBLIC Threads::Threads)
target_compile_options(omnithread_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


add_library(omnithread SHARED ${OMNITHREAD_SRC})
target_link_libraries(omnithread PRIVATE Threads::Threads)
target_compile_definitions(omnithread PRIVATE _REENTRANT ${OMNITHREAT_DEFS} ${OMNITHREAT_DEFS_SHARED})
target_include_directories(omnithread PRIVATE . ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(omnithread PUBLIC Threads::Threads)
target_compile_options(omnithread PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


install(TARGETS omnithread_static omnithread
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)