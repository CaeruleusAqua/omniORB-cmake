set(OMNICONNECTIONMGMT4_STATIC_SRC
    omniConnectionMgmt.cc
    dataStub.cc)
add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_STATIC_SRC})
target_compile_definitions(omniConnectionMgmt4_static PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4_static PRIVATE .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4_static PRIVATE -O2 -Wall -Wno-unused -fexceptions )


set(OMNICONNECTIONMGMT4_SHARED_SRC
    omniConnectionMgmt.cc
    dataStub.cc)
add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SHARED_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniConnectionMgmt4 PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4 PRIVATE .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4 PRIVATE -fPIC -O2 -Wall -Wno-unused -fexceptions  )


set(OMNICONNECTIONMGMT4_STATIC_SRC
    omniConnectionMgmt.cc
    dataStub.cc)
add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_STATIC_SRC})
target_compile_definitions(omniConnectionMgmt4_static PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4_static PRIVATE .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4_static PRIVATE -O2 -Wall -Wno-unused -fexceptions )


set(OMNICONNECTIONMGMT4_SHARED_SRC
    omniConnectionMgmt.cc
    dataStub.cc)
add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SHARED_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniConnectionMgmt4 PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4 PRIVATE .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4 PRIVATE -fPIC -O2 -Wall -Wno-unused -fexceptions  )


