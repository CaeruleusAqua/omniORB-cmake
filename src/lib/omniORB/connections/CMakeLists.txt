set(OMNICONNECTIONMGMT4_SRC
    omniConnectionMgmt.cc
    dataStub.cc)
add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_SRC})
target_compile_definitions(omniConnectionMgmt4_static PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4_static PRIVATE -Wno-unused -fexceptions )


add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(omniConnectionMgmt4 PRIVATE _REENTRANT UnixArchitecture)
target_include_directories(omniConnectionMgmt4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniConnectionMgmt4 PRIVATE -Wno-unused -fexceptions  )