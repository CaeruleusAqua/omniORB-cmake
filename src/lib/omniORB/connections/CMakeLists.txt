
set(OMNICONNECTIONMGMT4_SRC
        omniConnectionMgmt.cc
        dataStub.cc
        )

add_library(omniConnectionMgmt4_static STATIC ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4_static PRIVATE omniORB4_static omnithread_static Threads::Threads)
target_compile_definitions(omniConnectionMgmt4_static PRIVATE )
target_compile_options(omniConnectionMgmt4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


add_library(omniConnectionMgmt4 SHARED ${OMNICONNECTIONMGMT4_SRC})
target_link_libraries(omniConnectionMgmt4 PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniConnectionMgmt4 PRIVATE )
target_compile_options(omniConnectionMgmt4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})



install(TARGETS omniConnectionMgmt4_static omniConnectionMgmt4
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)