set(OMNICODESETS4_SRC
    cs-8859-2.cc
    cs-8859-3.cc
    cs-8859-4.cc
    cs-8859-5.cc
    cs-8859-6.cc
    cs-8859-7.cc
    cs-8859-8.cc
    cs-8859-9.cc
    cs-8859-10.cc
    cs-8859-11.cc
    cs-8859-13.cc
    cs-8859-14.cc
    cs-8859-15.cc
    cs-8859-16.cc
    cs-UCS-4.cc
    cs-cp1250.cc
    cs-cp1251.cc
    cs-cp1252.cc
    cs-cp1253.cc
    cs-cp1254.cc
    cs-cp1255.cc
    cs-cp1256.cc
    cs-cp1257.cc
    cs-cp1258.cc
    cs-037.cc
    cs-500.cc
    cs-EDF-4.cc
    cs-GBK.cc
    omniCodeSets.cc)
add_library(omniCodeSets4_static STATIC ${OMNICODESETS4_SRC})
target_link_libraries(omniCodeSets4_static PRIVATE omniORB4_static omnithread_static Threads::Threads)
target_compile_definitions(omniCodeSets4_static PRIVATE USE_omniORB_logStream)
target_include_directories(omniCodeSets4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include )
target_compile_options(omniCodeSets4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )


add_library(omniCodeSets4 SHARED ${OMNICODESETS4_SRC})
target_link_libraries(omniCodeSets4 PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniCodeSets4 PRIVATE USE_omniORB_logStream)
target_include_directories(omniCodeSets4 PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB {CMAKE_SOURCE_DIR}/include/omniORB4/internal ${CMAKE_SOURCE_DIR}/include)
target_compile_options(omniCodeSets4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS}  )


install(TARGETS omniCodeSets4_static omniCodeSets4
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)