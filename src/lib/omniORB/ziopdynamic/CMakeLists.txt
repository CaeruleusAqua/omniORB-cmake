set(OMNIZIOPDYNAMIC4_SRC
    omniZIOPDynamic.cc
    compressionDynStubs.cc
    ziopDynStubs.cc)

find_package(ZLIB REQUIRED)

add_library(omniZIOPDynamic4_static STATIC ${OMNIZIOPDYNAMIC4_SRC})
target_link_libraries(omniZIOPDynamic4_static PUBLIC omniORB4_static omniZIOP4_static omniDynamic4_static omnithread Threads::Threads ${ZLIB_LIBRARIES})
target_compile_definitions(omniZIOPDynamic4_static PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY)# UnixArchitecture)
target_include_directories(omniZIOPDynamic4_static PRIVATE ${ZLIB_INCLUDE_DIR} ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include/omniORB4/internal . ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniZIOPDynamic4_static PRIVATE -Wno-unused -fexceptions)
add_dependencies(omniZIOPDynamic4_static RunGenerator)

add_library(omniZIOPDynamic4 SHARED ${OMNIZIOPDYNAMIC4_SRC})
target_link_libraries(omniZIOPDynamic4 PUBLIC omniORB4 omniZIOP4 omniDynamic4 omnithread Threads::Threads ${ZLIB_LIBRARIES})
target_compile_definitions(omniZIOPDynamic4 PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY)# UnixArchitecture)
target_include_directories(omniZIOPDynamic4 PRIVATE ${ZLIB_INCLUDE_DIR} ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include/omniORB4/internal . ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniZIOPDynamic4 PRIVATE -Wno-unused -fexceptions)
add_dependencies(omniZIOPDynamic4 RunGenerator)

