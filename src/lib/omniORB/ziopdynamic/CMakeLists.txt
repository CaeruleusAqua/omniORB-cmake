set(OMNIZIOPDYNAMIC4_STATIC_SRC
    omniZIOPDynamic.cc
    compressionDynStubs.cc
    ziopDynStubs.cc)
add_library(omniZIOPDynamic4_static STATIC ${OMNIZIOPDYNAMIC4_STATIC_SRC})
target_compile_definitions(omniZIOPDynamic4_static PRIVATE _REENTRANT _OMNIORB_ZIOP_DYNAMIC_LIBRARY UnixArchitecture)
target_include_directories(omniZIOPDynamic4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniZIOPDynamic4_static PRIVATE -Wno-unused -fexceptions )


set(OMNIZIOPDYNAMIC4_SHARED_SRC
    omniZIOPDynamic.cc
    compressionDynStubs.cc
    ziopDynStubs.cc)
add_library(omniZIOPDynamic4 SHARED ${OMNIZIOPDYNAMIC4_SHARED_SRC})
target_link_libraries(omniZIOPDynamic4 PRIVATE omniORB4 omniDynamic4 omnithread pthread)
target_compile_definitions(omniZIOPDynamic4 PRIVATE _REENTRANT _OMNIORB_ZIOP_DYNAMIC_LIBRARY UnixArchitecture)
target_include_directories(omniZIOPDynamic4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB .. ./.. ../../../../include/omniORB4/internal ../../../../include/omniORB4/internal . . ../../../../include ../../../../include)
target_compile_options(omniZIOPDynamic4 PRIVATE -Wno-unused -fexceptions  )