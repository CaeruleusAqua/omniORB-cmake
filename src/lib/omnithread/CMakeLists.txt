find_package(Threads REQUIRED)
if (THREADS_HAVE_PTHREAD_ARG)
    set(OMNITHREAD_STATIC_SRC posix.cc threaddata.cc)
    set(OMNITHREAT_DEFS "NoNanoSleep PthreadDraftVersion=10")
else ()
    set(OMNITHREAD_SRC NT.cc threaddata.cc)
    set(OMNITHREAT_DEFS "")
endif ()


add_library(omnithread_static STATIC ${OMNITHREAD_SRC})
target_compile_definitions(omnithread_static PRIVATE _REENTRANT ${OMNITHREAT_DEFS})
target_include_directories(omnithread_static PRIVATE . . ../../../include ../../../include)
target_link_libraries(omnithread_static PUBLIC Threads::Threads)
target_compile_options(omnithread_static PRIVATE -Wno-unused -fexceptions)


add_library(omnithread SHARED ${OMNITHREAD_SRC})
target_link_libraries(omnithread PRIVATE pthread)
target_compile_definitions(omnithread PRIVATE _REENTRANT ${OMNITHREAT_DEFS})
target_include_directories(omnithread PRIVATE . . ../../../include ../../../include)
target_link_libraries(omnithread PUBLIC Threads::Threads)
target_compile_options(omnithread PRIVATE -Wno-unused -fexceptions)
