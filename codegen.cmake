if (NOT WIN32)
    if (${Python_VERSION_MAJOR} EQUAL 2)
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python\"")
        set(OMNI_PYTHON_RESOURCES ${CMAKE_SOURCE_DIR}/src/lib/omniORB/python)
    else ()
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
        set(OMNI_PYTHON_RESOURCES ${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3)
    endif ()
    SET(OMNIIDL_PLATFORM_FLAGS "")
    set(OMNIIDL_EXEC ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl)
else ()
    if (${Python_VERSION_MAJOR} EQUAL 2)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python\"")
        set(OMNI_PYTHON_RESOURCES ${CMAKE_SOURCE_DIR}/src/lib/omniORB/python)
    else ()
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
        set(OMNI_PYTHON_RESOURCES ${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3)
    endif ()

    set(PYTHONHOME "PYTHONHOME=${Python_RUNTIME_LIBRARY_DIRS}")
    SET(OMNIIDL_PLATFORM_FLAGS "-T")
    set(OMNIIDL_EXEC ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PYTHONHOME} $<TARGET_FILE:omniidl>)
endif ()


set(GEN_DIR ${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4/)
file(MAKE_DIRECTORY ${GEN_DIR})



ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/Naming.hh ${GEN_DIR}/NamingDynSK.cc ${GEN_DIR}/NamingSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba  -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/Naming.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/Naming.idl omniidl omnicpp
        COMMENT "Processing Naming.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/corbaidlSK.cc ${GEN_DIR}/corbaidlDynSK.cc ${GEN_DIR}/corbaidl_poa.hh ${GEN_DIR}/corbaidl_operators.hh ${GEN_DIR}/corbaidl_defs.hh
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -nf -P -WbF -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl omniidl omnicpp
        COMMENT "Processing corbaidl.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/ir_defs.hh ${GEN_DIR}/ir_operators.hh ${GEN_DIR}/ir_poa.hh ${GEN_DIR}/irDynSK.cc ${GEN_DIR}/irSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba  -WbF -I. -I${CMAKE_SOURCE_DIR} -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/ir.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ir.idl omniidl omnicpp
        COMMENT "Processing ir.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/boxes_defs.hh ${GEN_DIR}/boxes_operators.hh ${GEN_DIR}/boxes_poa.hh ${GEN_DIR}/boxesDynSK.cc ${GEN_DIR}/boxesSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -nf -P -WbF -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/boxes.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/boxes.idl omniidl omnicpp
        COMMENT "Processing boxes.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/pollable_defs.hh ${GEN_DIR}/pollable_operators.hh ${GEN_DIR}/pollable_poa.hh ${GEN_DIR}/pollableDynSK.cc ${GEN_DIR}/pollableSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -nf -P -WbF -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/pollable.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/pollable.idl omniidl omnicpp
        COMMENT "Processing pollable.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/poa_enums_defs.hh ${GEN_DIR}/poa_enums_operators.hh ${GEN_DIR}/poa_enums_poa.hh ${GEN_DIR}/poa_enumsDynSK.cc ${GEN_DIR}/poa_enumsSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -nf -P -WbF -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl omniidl omnicpp
        COMMENT "Processing poa_enums.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/omniTypedefs.hh ${GEN_DIR}/omniTypedefsSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl omniidl omnicpp
        COMMENT "Processing omniTypedefs.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/bootstrap.hh ${GEN_DIR}/bootstrapDynSK.cc ${GEN_DIR}/bootstrapSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba  -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl omniidl omnicpp
        COMMENT "Processing bootstrap.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/omniConnectionData.hh ${GEN_DIR}/omniConnectionDataSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl omniidl omnicpp
        COMMENT "Processing omniConnectionData.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/messaging.hh ${GEN_DIR}/messagingSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/messaging.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging.idl omniidl omnicpp
        COMMENT "Processing messaging.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/messaging_policy.hh ${GEN_DIR}/messaging_policySK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl omniidl omnicpp
        COMMENT "Processing messaging_policy.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/compression.hh ${GEN_DIR}/compressionDynSK.cc ${GEN_DIR}/compressionSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -I. -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/compression.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/compression.idl omniidl omnicpp
        COMMENT "Processing compression.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/ziop_defs.hh ${GEN_DIR}/ziop_operators.hh ${GEN_DIR}/ziop_poa.hh ${GEN_DIR}/ziopDynSK.cc ${GEN_DIR}/ziopSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -WbF -Wba -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/ziop.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ziop.idl omniidl omnicpp
        COMMENT "Processing ziop.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/distdate.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${Python_EXECUTABLE} ${CMAKE_SOURCE_DIR}/bin/scripts/distdate.py < ${CMAKE_SOURCE_DIR}/update.log > ${GEN_DIR}/distdate.hh
        DEPENDS ${CMAKE_SOURCE_DIR}/update.log omniidl omnicpp
        COMMENT "Processing update.log..")


ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/value.hh ${GEN_DIR}/valueSK.hh ${GEN_DIR}/valueSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/value.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/src/examples/valuetype/simple/value.idl omniidl omnicpp
        COMMENT "Processing value.idl..")


ADD_CUSTOM_TARGET(RunGeneratorXXdfdfsd DEPENDS
        omniidl
        omnicpp
        ${GEN_DIR}/value.hh
        ${GEN_DIR}/valueSK.cc
        ${GEN_DIR}/valueSK.hh
        COMMENT "Checking if re-generation is required")


ADD_CUSTOM_TARGET(RunGenerator DEPENDS
        omniidl
        omnicpp
        ${GEN_DIR}/valueSK.cc
        ${GEN_DIR}/distdate.hh
        ${GEN_DIR}/ziop_defs.hh
        ${GEN_DIR}/compressionSK.cc
        ${GEN_DIR}/messaging_policySK.cc
        ${GEN_DIR}/omniConnectionDataSK.cc
        ${GEN_DIR}/messagingSK.cc
        ${GEN_DIR}/omniTypedefs.hh
        ${GEN_DIR}/bootstrap.hh
        ${GEN_DIR}/boxes_defs.hh
        ${GEN_DIR}/pollable_defs.hh
        ${GEN_DIR}/poa_enums_defs.hh
        ${GEN_DIR}/corbaidlSK.cc
        ${GEN_DIR}/corbaidlDynSK.cc
        ${GEN_DIR}/corbaidl_poa.hh
        ${GEN_DIR}/corbaidl_operators.hh
        ${GEN_DIR}/corbaidl_defs.hh
        ${GEN_DIR}/Naming.hh
        ${GEN_DIR}/NamingDynSK.cc
        ${GEN_DIR}/NamingSK.cc
        ${GEN_DIR}/ir_defs.hh
        ${GEN_DIR}/ir_operators.hh
        ${GEN_DIR}/ir_poa.hh
        ${GEN_DIR}/irDynSK.cc
        ${GEN_DIR}/irSK.cc
        COMMENT "Checking if re-generation is required")