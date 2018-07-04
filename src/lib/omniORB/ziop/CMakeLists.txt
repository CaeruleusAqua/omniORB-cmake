set(OMNIZIOP4_SRC
        omniZIOP.cc
        omniZIOPImpl.h
        ziopStubs.cc
        messagingStubs.cc
        zlibCompressor.cc)

find_package(ZLIB REQUIRED)

add_library(omniZIOP4_static STATIC ${OMNIZIOP4_SRC})
target_link_libraries(omniZIOP4_static PUBLIC omniORB4 omnithread Threads::Threads ZLIB::ZLIB)
target_compile_definitions(omniZIOP4_static PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY)
target_include_directories(omniZIOP4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniZIOP4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(omniZIOP4_static RunGenerator)

add_library(omniZIOP4 SHARED ${OMNIZIOP4_SRC})
target_link_libraries(omniZIOP4 PUBLIC omniORB4 omnithread Threads::Threads ZLIB::ZLIB)
target_compile_definitions(omniZIOP4 PRIVATE _REENTRANT _OMNIORB_ZIOP_LIBRARY)
target_include_directories(omniZIOP4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniZIOP4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(omniZIOP4 RunGenerator)

