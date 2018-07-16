if (NOT WIN32)
    if (${Python_VERSION_MAJOR} EQUAL 2)
        set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python\"")
        set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python)
    else ()
        set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3\"")
        set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python3)
    endif ()
    SET(OMNIIDL_PLATFORM_FLAGS "")
    set(OMNIIDL_EXEC ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${PROJECT_BINARY_DIR}/bin/omniidl)
else ()
    if (${Python_VERSION_MAJOR} EQUAL 2)
        set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python\"")
        set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python)
    else ()
        set(PYTHONPATH "PYTHONPATH=\"${PROJECT_SOURCE_DIR}/src/tool/omniidl/python3\"")
        set(OMNI_PYTHON_RESOURCES ${PROJECT_SOURCE_DIR}/src/lib/omniORB/python3)
    endif ()
    if (${Python_ROOT_DIR})
        set(PYTHONHOME "PYTHONHOME=${Python_ROOT_DIR}")
    endif ()

    SET(PATH_ENV PATH=${Python_RUNTIME_LIBRARY_DIRS})
    STRING(REGEX REPLACE ";" "\\\\;" PATH_ENV ${PATH_ENV})
    message("-----------${PYTHONHOME}")
    message("------------${PATH_ENV}")
    SET(OMNIIDL_PLATFORM_FLAGS "-T")
    set(OMNIIDL_EXEC ${CMAKE_COMMAND} -E env ${PATH_ENV} ${PYTHONHOME} ${PYTHONPATH} $<TARGET_FILE:omniidl>)
endif ()


set(GEN_DIR ${PROJECT_BINARY_DIR}/generated/lib/omniORB/omniORB4/)
set(IDL_DIR ${PROJECT_SOURCE_DIR}/idl/)


macro(RUN_OMNIIDL IDL_FILE OUTPUT_DIRECTORY INCLUDE_DIRECTORY OPTIONS OUTPUT_FILES)
    file(MAKE_DIRECTORY ${OUTPUT_DIRECTORY})
    get_filename_component(IDL_FILE_BASENAME ${IDL_FILE} NAME)
    set(INTERNAL_OUTPUT_FILES ${OUTPUT_FILES})
    set(INTERNAL_OPTIONS ${OPTIONS})
    set(OUT_WITH_PATH)
    foreach (arg IN LISTS INTERNAL_OUTPUT_FILES)
        set(OUT_WITH_PATH ${OUT_WITH_PATH} ${OUTPUT_DIRECTORY}/${arg})
    endforeach ()
    ADD_CUSTOM_COMMAND(OUTPUT ${OUT_WITH_PATH}
            COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${INCLUDE_DIRECTORY} ${INTERNAL_OPTIONS} -C${OUTPUT_DIRECTORY} ${IDL_FILE}
            DEPENDS ${IDL_FILE} omniidl omnicpp
            COMMENT "Processing ${IDL_FILE_BASENAME}..")

    set(OUTPARAM "${ARGN}")
    foreach (loop_var IN LISTS OUTPARAM)
        set(${OUTPARAM} ${${OUTPARAM}} ${OUT_WITH_PATH})
    endforeach ()

endmacro(RUN_OMNIIDL)

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
RUN_OMNIIDL(${IDL_DIR}/compression.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-Wba" "ompression.hh;compressionDynSK.cc;compressionSK.cc" SOURCE_FILES)
RUN_OMNIIDL(${IDL_DIR}/ziop.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wbdebug;-WbF;-Wba" "ziop_defs.hh;ziop_operators.hh;ziop_poa.hh;ziopDynSK.cc;ziopSK.cc" SOURCE_FILES)


ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/distdate.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${PROJECT_SOURCE_DIR}/bin/scripts/distdate.py < ${PROJECT_SOURCE_DIR}/update.log > ${GEN_DIR}/distdate.hh
        DEPENDS ${PROJECT_SOURCE_DIR}/update.log omniidl omnicpp
        COMMENT "Processing update.log..")


ADD_CUSTOM_TARGET(RunGenerator DEPENDS
        ${SOURCE_FILES}
        ${GEN_DIR}/distdate.hh
        COMMENT "Checking if re-generation is required for target omniORB4")