if (${Python_VERSION_MAJOR} EQUAL 2)
    set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python\"")
    set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python)
else ()
    set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3\"")
    set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python3)
endif ()

set(PYTHONPATH_INSTALL "PYTHONPATH=\"\${PACKAGE_PREFIX_DIR}/${PYTHON_SITE}\"")
set(OMNI_PYTHON_RESOURCES_INSTALL ${PYTHON_SITE})

if (WIN32)
    if (VCPKG_TOOLCHAIN)
        find_package(Python REQUIRED COMPONENTS Interpreter Development)
    else()
        if (Python_ROOT_DIR)
            string(REGEX REPLACE "\\\\" "/" python_root ${Python_ROOT_DIR})
            set(PYTHONHOME "PYTHONHOME=${python_root}")
        else ()
            set(PYTHONHOME "PYTHONHOME=${Python_STDLIB}/..")
        endif ()
        set(Python_RUNTIME_LIBRARY_DIRS ${Python_RUNTIME_LIBRARY_DIRS} ${PROJECT_SOURCE_DIR})
        set(PATH_ENV)
        FOREACH (_PATH ${Python_RUNTIME_LIBRARY_DIRS})
            set(PATH_ENV "${_PATH}$<SEMICOLON>${PATH_ENV}")
        ENDFOREACH ()
        set(PATH_ENV PATH=${PATH_ENV})
        set(OMNIIDL_PLATFORM_FLAGS "-T")

        set(OMNIORB4_IDL_COMPILER "${CMAKE_COMMAND}" -E env ${PATH_ENV}${CMAKE_BINARY_DIR}/bin ${PYTHONHOME} ${PYTHONPATH} $<TARGET_FILE:omniidl>)
        set(OMNIIDL_EXEC_INSTALL "\"${CMAKE_COMMAND}\"" -E env ${PATH_ENV} ${PYTHONHOME} ${PYTHONPATH_INSTALL} $<TARGET_FILE:OmniORB::omniidl>)
    endif()

else ()
    set(OMNIIDL_PLATFORM_FLAGS "")
    set(OMNIORB4_IDL_COMPILER ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${PROJECT_BINARY_DIR}/bin/omniidl)
    set(OMNIIDL_EXEC_INSTALL ${CMAKE_COMMAND} -E env ${PYTHONPATH_INSTALL} ${Python_EXECUTABLE} \${PACKAGE_PREFIX_DIR}/bin/omniidl)

endif ()

set(RUN_OMNIIDL_DEPS omniidl omnicpp)

include(cmake/run_omniidl.cmake)

set(GEN_DIR ${PROJECT_BINARY_DIR}/generated/lib/omniORB/omniORB4/)
set(IDL_DIR ${PROJECT_SOURCE_DIR}/idl/)
set(SOURCE_FILES)

RUN_OMNIIDL(${IDL_DIR}/Naming.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wba;-Wbdebug" "Naming.hh;NamingDynSK.cc;NamingSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/corbaidl.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba;-nf;-P;-WbF" "corbaidlSK.cc;corbaidlDynSK.cc;corbaidl_poa.hh;corbaidl_operators.hh;corbaidl_defs.hh" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/ir.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba;-WbF" "ir_defs.hh;ir_operators.hh;ir_poa.hh;irDynSK.cc;irSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/boxes.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba;-nf;-P;-WbF" "boxes_defs.hh;boxes_operators.hh;boxes_poa.hh;boxesDynSK.cc;boxesSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/pollable.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba;-nf;-P;-WbF" "pollable_defs.hh;pollable_operators.hh;pollable_poa.hh;pollableDynSK.cc;pollableSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/poa_enums.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba;-nf;-P;-WbF" "poa_enums_defs.hh;poa_enums_operators.hh;poa_enums_poa.hh;poa_enumsDynSK.cc;poa_enumsSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/omniTypedefs.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug" "omniTypedefs.hh;omniTypedefsSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/bootstrap.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba" "bootstrap.hh;bootstrapDynSK.cc;bootstrapSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/omniConnectionData.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug" "omniConnectionData.hh;omniConnectionDataSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/messaging.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug" "messaging.hh;messagingSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/messaging_policy.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug" "messaging_policy.hh;messaging_policySK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/compression.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba" "compression.hh;compressionDynSK.cc;compressionSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/ziop.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-WbF;-Wba" "ziop_defs.hh;ziop_operators.hh;ziop_poa.hh;ziopDynSK.cc;ziopSK.cc" SOURCE_FILES)


ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/distdate.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${PROJECT_SOURCE_DIR}/bin/scripts/distdate.py < ${PROJECT_SOURCE_DIR}/update.log > ${GEN_DIR}/distdate.hh
        DEPENDS ${PROJECT_SOURCE_DIR}/update.log omniidl omnicpp
        COMMENT "Processing update.log..")


ADD_CUSTOM_TARGET(RunGenerator DEPENDS
        ${SOURCE_FILES}
        ${GEN_DIR}/distdate.hh
        COMMENT "Checking if re-generation is required for target omniORB4")


INSTALL(DIRECTORY ${PROJECT_BINARY_DIR}/generated/lib/omniORB/
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING PATTERN "*.h*")

