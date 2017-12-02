set(OMNIZIOP4_STATIC_SRC
        omniZIOP.cc
        omniZIOPImpl.h
        ziopStubs.cc
        messagingStubs.cc
        zlibCompressor.cc)
add_library(omniZIOP4_static STATIC ${OMNIZIOP4_STATIC_SRC})
target_compile_definitions(omniZIOP4_static PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY UnixArchitecture)
target_include_directories(omniZIOP4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniZIOP4_static PRIVATE -Wno-unused -fexceptions)
add_dependencies(omniZIOP4_static RunGenerator)


set(OMNIZIOP4_SHARED_SRC
        omniZIOP.cc
        omniZIOPImpl.h
        ziopStubs.cc
        messagingStubs.cc
        zlibCompressor.cc)
add_library(omniZIOP4 SHARED ${OMNIZIOP4_SHARED_SRC})
target_link_libraries(omniZIOP4 PRIVATE omniORB4 omnithread pthread z)
target_compile_definitions(omniZIOP4 PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY UnixArchitecture)
target_include_directories(omniZIOP4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniZIOP4 PRIVATE -Wno-unused -fexceptions)
add_dependencies(omniZIOP4 RunGenerator)