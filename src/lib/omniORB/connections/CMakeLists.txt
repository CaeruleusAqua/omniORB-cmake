
set(OMNICONNECTIONMGMT4_SRC
        omniConnectionMgmt.cc
        dataStub.cc
        )

add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_SRC})
target_compile_definitions(omniConnectionMgmt4_static PRIVATE _REENTRANT)
target_include_directories(omniConnectionMgmt4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniConnectionMgmt4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(omniConnectionMgmt4_static RunGenerator)


add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniConnectionMgmt4 PRIVATE _REENTRANT)
target_include_directories(omniConnectionMgmt4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniConnectionMgmt4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(omniConnectionMgmt4_static RunGenerator)