
set(OMNICONNECTIONMGMT4_SRC
        omniConnectionMgmt.cc
        dataStub.cc
        )

add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4_static PRIVATE omniORB4_static omnithread_static Threads::Threads)
target_compile_definitions(omniConnectionMgmt4_static PRIVATE )
target_include_directories(omniConnectionMgmt4_static PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB ${PROJECT_SOURCE_DIR}/include/omniORB4/internal ${PROJECT_SOURCE_DIR}/include)
target_compile_options(omniConnectionMgmt4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniConnectionMgmt4 PRIVATE )
target_include_directories(omniConnectionMgmt4 PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB ${PROJECT_SOURCE_DIR}/include/omniORB4/internal ${PROJECT_SOURCE_DIR}/include)
target_compile_options(omniConnectionMgmt4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})



install(TARGETS omniConnectionMgmt4_static omniConnectionMgmt4
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)