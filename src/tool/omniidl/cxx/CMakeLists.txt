add_subdirectory(cccp)

set(_OMNIIDLMODULE_SHARED_SRC
    y.tab.cc
    lex.yy.cc
    idlerr.cc
    idlutil.cc
    idltype.cc
    idlrepoId.cc
    idlscope.cc
    idlexpr.cc
    idlast.cc
    idlvalidate.cc
    idldump.cc
    idlconfig.cc
    idlfixed.cc
    idlpython.cc)
add_library(_omniidlmodule SHARED ${_OMNIIDLMODULE_SHARED_SRC})
target_compile_definitions(_omniidlmodule PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> IDLMODULE_VERSION="0x2630")
target_include_directories(_omniidlmodule PRIVATE /usr/include/python2.7 . . ../../../../include ../../../../include)
target_compile_options(_omniidlmodule PRIVATE -O2 -Wall -Wno-unused -fexceptions  -fPIC)
