if(${CMAKE_VERSION} VERSION_GREATER "3.12")
    cmake_policy(SET CMP0075 NEW)
endif()

INCLUDE(CheckFunctionExists)
INCLUDE(CheckIncludeFiles)
INCLUDE(CheckTypeSize)
INCLUDE(CheckPrototypeDefinition)
INCLUDE(CheckSymbolExists)
INCLUDE(TestForSTDNamespace)
include(${CMAKE_SOURCE_DIR}/cmake/CheckWinVer.cmake)


if ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "x86_64" OR "${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "AMD64")
    set(PROCESSOR_NAME x86Processor)
    set(PROCESSOR_DEFINE __x86_64__)
    add_definitions(-D__x86__)
else ()
    message(FATAL_ERROR "System: ${CMAKE_SYSTEM_PROCESSOR} not supported")
endif ()


# Variables used in configure_file
if (WIN32)

    set(OSVERSION "4")
    set(PLATFORM_DEFINE "__NT__")
    set(PLATFORM_NAME "Windows")
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
    ##get_WIN32_WINNT(_WIN32_WINNT)
    set(_WIN32_WINNT 0x0501) # force XP Compatibility for now
    set(__WIN32__ 1)
    set(CMAKE_REQUIRED_DEFINITIONS -D__WIN32__ -D__NT__ -D_WIN32_WINNT=${_WIN32_WINNT} -D__OSVERSION__=4)
    add_definitions(-D__WIN32__ -D__NT__ -D_WIN32_WINNT=${_WIN32_WINNT} -D__OSVERSION__=4)
elseif (UNIX AND NOT APPLE)
    set(OSVERSION "2")
    set(PLATFORM_DEFINE "__linux__")
    set(PLATFORM_NAME "Linux")
else ()
    message(FATAL_ERROR "System: ${CMAKE_SYSTEM_NAME} not supported")
endif ()


set(CFG_HEADERS)
set(CFG_LIBS)

macro(CHECK_INCLUDE_AND_ADD header var)
    CHECK_INCLUDE_FILES("${header}" ${var})
    if (${var})
        list(APPEND CFG_HEADERS "${header}")
        list(APPEND CFG_LIBS ${ARGN})
    endif ()
endmacro(CHECK_INCLUDE_AND_ADD)


if (NOT ${CMAKE_NO_STD_NAMESPACE})
    set(HAVE_CATCH_BY_BASE 1)
    set(HAVE_CONST_CAST 1)
    set(HAVE_DYNAMIC_CAST 1)
    set(HAVE_REINTERPRET_CAST 1)
    set(HAVE_MEMBER_CONSTANTS 1)
    set(HAVE_NAMESPACES 1)
    set(HAVE_EXCEPTIONS 1)
    set(HAVE_STD 1)
endif ()



CHECK_INCLUDE_AND_ADD(alloca.h HAVE_ALLOCA_H)
CHECK_INCLUDE_AND_ADD(signal.h HAVE_SIGNAL_H)
CHECK_INCLUDE_AND_ADD(errno.h HAVE_ERRNO_H)
CHECK_INCLUDE_AND_ADD(fcntl.h HAVE_FCNTL_H)
CHECK_INCLUDE_AND_ADD(ifaddrs.h HAVE_IFADDRS_H)
CHECK_INCLUDE_AND_ADD(inttypes.h HAVE_INTTYPES_H)
CHECK_INCLUDE_AND_ADD(memory.h HAVE_MEMORY_H)
CHECK_INCLUDE_AND_ADD(nan.h HAVE_NAN_H)
CHECK_INCLUDE_AND_ADD(netdb.h HAVE_NETDB_H)
CHECK_INCLUDE_AND_ADD(stdint.h HAVE_STDINT_H)
CHECK_INCLUDE_AND_ADD(stdlib.h HAVE_STDLIB_H)
CHECK_INCLUDE_AND_ADD(stdio.h HAVE_STDIO_H)
CHECK_INCLUDE_AND_ADD(stdarg.h HAVE_STDARG_H)
CHECK_INCLUDE_AND_ADD(strings.h HAVE_STRINGS_H)
CHECK_INCLUDE_AND_ADD(string.h HAVE_STRING_H)
CHECK_INCLUDE_AND_ADD(sys/if.h HAVE_SYS_IF_H)
CHECK_INCLUDE_AND_ADD(sys/ioctl.h HAVE_SYS_IOCTL_H)
CHECK_INCLUDE_AND_ADD(sys/param.h HAVE_SYS_PARAM_H)
CHECK_INCLUDE_AND_ADD(sys/poll.h HAVE_SYS_POLL_H)
CHECK_INCLUDE_AND_ADD(sys/stat.h HAVE_SYS_STAT_H)
if (NOT WIN32) # TODO Fix in Code
    CHECK_INCLUDE_AND_ADD(sys/time.h HAVE_SYS_TIME_H)
endif ()
CHECK_INCLUDE_AND_ADD(sys/types.h HAVE_SYS_TYPES_H)
CHECK_INCLUDE_AND_ADD(unistd.h HAVE_UNISTD_H)
CHECK_INCLUDE_AND_ADD("winsock2.h;ws2tcpip.h" HAVE_WINSOCKS2_H ws2_32 mswsock)
CHECK_INCLUDE_AND_ADD("sys/socket.h;netinet/in.h" HAVE_SOCKET_H)
if (NOT WIN32) # TODO Fix in Code
    CHECK_INCLUDE_AND_ADD("sys/time.h;time.h" TIME_WITH_SYS_TIME)
endif ()

set(CMAKE_REQUIRED_LIBRARIES "${CFG_LIBS}")
set(CMAKE_EXTRA_INCLUDE_FILES "${CFG_HEADERS}")

CHECK_SYMBOL_EXISTS(SIG_IGN "${CFG_HEADERS}" HAVE_SIG_IGN)
CHECK_SYMBOL_EXISTS(alloca "${CFG_HEADERS}" HAVE_ALLOCA)
CHECK_SYMBOL_EXISTS(access "${CFG_HEADERS}" HAVE_ACCESS)
CHECK_SYMBOL_EXISTS(getnameinfo "${CFG_HEADERS}" HAVE_GETNAMEINFO)
CHECK_SYMBOL_EXISTS(inet_ntop "${CFG_HEADERS}" HAVE_INET_NTOP)
CHECK_SYMBOL_EXISTS(insinff "${CFG_HEADERS}" HAVE_INSINFF)
CHECK_SYMBOL_EXISTS(isinf "${CFG_HEADERS}" HAVE_ISINF)
CHECK_SYMBOL_EXISTS(isinfl "${CFG_HEADERS}" HAVE_ISINFL)
CHECK_SYMBOL_EXISTS(IsNANorINF "${CFG_HEADERS}" HAVE_ISNANORINF)
CHECK_SYMBOL_EXISTS(localtime "${CFG_HEADERS}" HAVE_LOCALTIME)
CHECK_SYMBOL_EXISTS(nanosleep "${CFG_HEADERS}" HAVE_NANOSLEEP)
CHECK_SYMBOL_EXISTS(poll "${CFG_HEADERS}" HAVE_POLL)
CHECK_SYMBOL_EXISTS(rand_r "${CFG_HEADERS}" HAVE_RAND_R)
CHECK_SYMBOL_EXISTS(sigaction "${CFG_HEADERS}" HAVE_SIGACTION)
CHECK_SYMBOL_EXISTS(sigvec "${CFG_HEADERS}" HAVE_SIGVEC)
CHECK_SYMBOL_EXISTS(snprintf "${CFG_HEADERS}" HAVE_SNPRINTF)
CHECK_SYMBOL_EXISTS(strcasecmp "${CFG_HEADERS}" HAVE_STRCASECMP)
CHECK_SYMBOL_EXISTS(strdup "${CFG_HEADERS}" HAVE_STRDUP)
CHECK_SYMBOL_EXISTS(strerror "${CFG_HEADERS}" HAVE_STRERROR)
CHECK_SYMBOL_EXISTS(strftime "${CFG_HEADERS}" HAVE_STRFTIME)
CHECK_SYMBOL_EXISTS(stricmp "${CFG_HEADERS}" HAVE_STRICMP)
CHECK_SYMBOL_EXISTS(strncasecmp "${CFG_HEADERS}" HAVE_STRNCASECMP)
CHECK_SYMBOL_EXISTS(strtoul "${CFG_HEADERS}" HAVE_STRTOUL)
CHECK_SYMBOL_EXISTS(strtoull "${CFG_HEADERS}" HAVE_STRTOULL)
CHECK_SYMBOL_EXISTS(strtouq "${CFG_HEADERS}" HAVE_STRTOUQ)
CHECK_SYMBOL_EXISTS(uname "${CFG_HEADERS}" HAVE_UNAME)
CHECK_SYMBOL_EXISTS(vprintf "${CFG_HEADERS}" HAVE_VPRINTF)
CHECK_SYMBOL_EXISTS(vsnprintf "${CFG_HEADERS}" HAVE_VSNPRINTF)
CHECK_SYMBOL_EXISTS(getaddrinfo "${CFG_HEADERS}" HAVE_GETADDRINFO)
CHECK_SYMBOL_EXISTS(gethostname "${CFG_HEADERS}" HAVE_GETHOSTNAME)
CHECK_SYMBOL_EXISTS(getopt "${CFG_HEADERS}" HAVE_GETOPT)
CHECK_SYMBOL_EXISTS(gettimeofday "${CFG_HEADERS}" HAVE_GETTIMEOFDAY)

CHECK_TYPE_SIZE("struct lifconf" STRUCT_LIFCONF)
CHECK_TYPE_SIZE("struct sockaddr_in6" HAVE_STRUCT_SOCKADDR_IN6)
CHECK_TYPE_SIZE("((struct sockaddr_in*)0)->sin_len" HAVE_STRUCT_SOCKADDR_IN_SIN_LEN)
CHECK_TYPE_SIZE("((struct sockaddr_in*)0)->sin_zero" HAVE_STRUCT_SOCKADDR_IN_SIN_ZERO)
CHECK_TYPE_SIZE("struct sockaddr_storage" HAVE_STRUCT_SOCKADDR_STORAGE)
if (NOT WIN32) # TODO Fix in Code
    try_compile(GETTIMEOFDAY_TIMEZONE ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_LIST_DIR}/cmake/timeofdayTimezone.c)
endif ()
CHECK_TYPE_SIZE("socklen_t" SOCKLEN_T_EXISTS)
if (SOCKLEN_T_EXISTS)
    set(OMNI_SOCKNAME_SIZE_T socklen_t)
endif ()

set(CMAKE_EXTRA_INCLUDE_FILES)

CHECK_TYPE_SIZE("wchar_t" SIZEOF_WCHAR_T)
CHECK_TYPE_SIZE("bool" SIZEOF_BOOL LANGUAGE CXX)
CHECK_TYPE_SIZE("bool" HAVE_BOOL LANGUAGE CXX)
CHECK_TYPE_SIZE("char" SIZEOF_CHAR)
CHECK_TYPE_SIZE("double" SIZEOF_DOUBLE)
CHECK_TYPE_SIZE("float" SIZEOF_FLOAT)
CHECK_TYPE_SIZE("int" SIZEOF_INT)
CHECK_TYPE_SIZE("long" SIZEOF_LONG)
CHECK_TYPE_SIZE("long double" SIZEOF_LONG_DOUBLE)
CHECK_TYPE_SIZE("long long" SIZEOF_LONG_LONG)
CHECK_TYPE_SIZE("short" SIZEOF_SHORT)
CHECK_TYPE_SIZE("unsigned char" SIZEOF_UNSIGNED_CHAR)
CHECK_TYPE_SIZE("void*" SIZEOF_VOIDP)


option(OMNIORB_DISABLE_ALLOCA "define if you want to avoid use of alloca" OFF)
option(OMNIORB_DISABLE_LONGDOUBLE "define if you want to disable long double support" OFF)
option(OMNIORB_ENABLE_LOCK_TRACES "if you want mutexes to be traced" OFF)
option(OMNI_DISABLE_ATOMIC_OPS "define if you want to disable atomic operations" OFF)
option(OMNI_DISABLE_IPV6 "define if you want to disable IPv6 support" OFF)
option(OMNI_USE_CFNETWORK_CONNECT "enable use of Mac / iOS CFNetwork (default disable-cfnetwork)" OFF)


#/* define if the compiler supports covariant return types */
#define OMNI_HAVE_COVARIANT_RETURNS /**/

#/* define if __sync_add_and_fetch and __sync_sub_and_fetch are available */
#define OMNI_HAVE_SYNC_ADD_AND_FETCH /**/

# TODO Unused in Code?
#/* define if base constructors have to be fully qualified */
#/* #undef OMNI_REQUIRES_FQ_BASE_CTOR */


# used for PackageConfig
# TODO generate PackageConfig files
set(PACKAGE_VERSION ${PROJECT_VERSION})

if (SIZEOF_LONG EQUAL SIZEOF_INT)
    set(OMNI_LONG_IS_INT 1)
endif ()


include(cmake/CheckStackDirection.cmake)
CHECK_STACK_DIRECTION(STACK_DIRECTION)

#/* Define to 1 if you have the ANSI C header files. */
include(cmake/CheckHeaderSTDC.cmake)
CHECK_HEADER_STDC(STDC_HEADERS)


INCLUDE(TestBigEndian)
TEST_BIG_ENDIAN(WORDS_BIGENDIAN)

#ase "$host" in
#*-*-linux-*)   plat_name="Linux";    plat_def="__linux__";    os_v="2";;
#*-*-uclinux-*) plat_name="Linux";    plat_def="__linux__";    os_v="2";;
#*-*-cygwin*)   plat_name="Cygwin";   plat_def="__cygwin__";   os_v="1";;
#*-*-solaris*)  plat_name="SunOS";    plat_def="__sunos__";    os_v="5";;
#*-*-osf3*)     plat_name="OSF1";     plat_def="__osf1__";     os_v="3";;
#*-*-osf4*)     plat_name="OSF1";     plat_def="__osf1__";     os_v="4";;
#*-*-osf5*)     plat_name="OSF1";     plat_def="__osf1__";     os_v="5";;
#*-*-hpux10*)   plat_name="HPUX";     plat_def="__hpux__";     os_v="10";;
#*-*-hpux11*)   plat_name="HPUX";     plat_def="__hpux__";     os_v="11";;
#*-*-nextstep*) plat_name="NextStep"; plat_def="__nextstep__"; os_v="3";;
#*-*-openstep*) plat_name="NextStep"; plat_def="__nextstep__"; os_v="3";;
#*-*-irix*)     plat_name="IRIX";     plat_def="__irix__";     os_v="6";;
#*-*-aix*)      plat_name="AIX";      plat_def="__aix__";      os_v="4";;
#*-*-darwin*)   plat_name="Darwin";   plat_def="__darwin__";   os_v="1";;
#*-*-freebsd3*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="3";;
#*-*-freebsd4*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="4";;
#*-*-freebsd5*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="5";;
#*-*-freebsd6*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="6";;
#*-*-freebsd7*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="7";;
#*-*-freebsd8*) plat_name="FreeBSD";  plat_def="__freebsd__";  os_v="8";;
#*-*-kfreebsd*) plat_name="kFreeBSD";  plat_def="__FreeBSD_kernel__";  os_v="6";;
#*-*-netbsd*)   plat_name="NetBSD";   plat_def="__netbsd__";   os_v="1";;
#*-*-openbsd*)  plat_name="OpenBSD";  plat_def="__openbsd__";  os_v="3";;
#*-*-sco*)      plat_name="OSR5";     plat_def="__osr5__";     os_v="5";;
#*-*-gnu*)      plat_name="GNU";      plat_def="__hurd__" ;    os_v="0";;
#esac

#case "$host" in
#i?86-*)   proc_name="x86Processor";     proc_def="__x86__";;
#x86_64-*) proc_name="x8664Processor";   proc_def="__x86_64__";;
#sparc-*)  proc_name="SparcProcessor";   proc_def="__sparc__";;
#alpha*)   proc_name="AlphaProcessor";   proc_def="__alpha__";;
#m68k-*)   proc_name="m68kProcessor";    proc_def="__m68k__";;
#mips*)    proc_name="IndigoProcessor";  proc_def="__mips__";;
#arm-*)    proc_name="ArmProcessor";     proc_def="__arm__";;
#s390-*)   proc_name="s390Processor";    proc_def="__s390__";;
#ia64-*)   proc_name="ia64Processor";    proc_def="__ia64__";;
#hppa*)    proc_name="HppaProcessor";    proc_def="__hppa__";;
#powerpc*) proc_name="PowerPCProcessor"; proc_def="__powerpc__";;
#esac



if (CMAKE_CXX_COMPILER_ID MATCHES "clang")
    # using Clang
elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    # using GCC
    set(COMPILE_FLAG_WNO_UNUSED -Wno-unused)
    set(COMPILE_FLAG_FEXCEPTIONS -fexceptions)
    set(COMPILE_FLAG_FPERMISSIVE -fpermissive)
    set(COMPILE_FLAG_WNO_WRITE_STRINGS -Wno-write-strings)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
    # using Intel C++
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    # using Visual Studio C++
endif ()

configure_file(include/omniconfig.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/omniconfig.h)
configure_file(include/omniORB4/acconfig_cmake.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/omniORB4/acconfig.h)