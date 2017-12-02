set(OMNITHREAD_STATIC_SRC
    posix.cc
    threaddata.cc)
add_library(omnithread_static STATIC ${OMNITHREAD_STATIC_SRC})
target_compile_definitions(omnithread_static PRIVATE _REENTRANT NoNanoSleep PthreadDraftVersion=10)
target_include_directories(omnithread_static PRIVATE . . ../../../include ../../../include)
target_compile_options(omnithread_static PRIVATE -Wno-unused -fexceptions )
add_dependencies(omnithread_static RunGenerator)


set(OMNITHREAD_SHARED_SRC
    posix.cc
    threaddata.cc)
add_library(omnithread SHARED ${OMNITHREAD_SHARED_SRC})
target_link_libraries(omnithread PRIVATE pthread)
target_compile_definitions(omnithread PRIVATE _REENTRANT NoNanoSleep PthreadDraftVersion=10)
target_include_directories(omnithread PRIVATE . . ../../../include ../../../include)
target_compile_options(omnithread PRIVATE -Wno-unused -fexceptions  )
add_dependencies(omnithread RunGenerator)