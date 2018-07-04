
INCLUDE(CheckFunctionExists)
INCLUDE(CheckIncludeFiles)
INCLUDE(CheckTypeSize)
INCLUDE(CheckPrototypeDefinition)
include(CheckSymbolExists)
include(TestForSTDNamespace)

if(NOT ${CMAKE_NO_STD_NAMESPACE})
    set(HAVE_CATCH_BY_BASE 1)
    set(HAVE_CONST_CAST 1)
    set(HAVE_DYNAMIC_CAST 1)
    set(HAVE_REINTERPRET_CAST 1)
    set(HAVE_MEMBER_CONSTANTS 1)
    set(HAVE_NAMESPACES 1)
    set(HAVE_EXCEPTIONS 1)
    set(HAVE_STD 1)
endif()


CHECK_INCLUDE_FILES (alloca.h HAVE_ALLOCA_H)
CHECK_FUNCTION_EXISTS (alloca HAVE_ALLOCA)
CHECK_FUNCTION_EXISTS (access HAVE_ACCESS)


CHECK_SYMBOL_EXISTS(SIG_IGN signal.h HAVE_SIG_IGN)

CHECK_TYPE_SIZE("struct lifconf" STRUCT_LIFCONF)

CHECK_INCLUDE_FILES("winsock2.h;ws2tcpip.h" HAVE_WINSOCKS2_H)
if (HAVE_WINSOCKS2_H)
    set(CMAKE_EXTRA_INCLUDE_FILES winsock2.h ws2tcpip.h)
else ()
    CHECK_INCLUDE_FILES("sys/socket.h;netinet/in.h" HAVE_SOCKET_H)
    if (HAVE_SOCKET_H)
        set(CMAKE_EXTRA_INCLUDE_FILES sys/socket.h netinet/in.h sys/types.h netdb.h)
    endif ()
endif ()

CHECK_TYPE_SIZE("struct sockaddr_in6" HAVE_STRUCT_SOCKADDR_IN6)

CHECK_TYPE_SIZE("((struct sockaddr_in*)0)->sin_len" HAVE_STRUCT_SOCKADDR_IN_SIN_LEN)

CHECK_TYPE_SIZE("((struct sockaddr_in*)0)->sin_zero" HAVE_STRUCT_SOCKADDR_IN_SIN_ZERO)

CHECK_TYPE_SIZE("struct sockaddr_storage" HAVE_STRUCT_SOCKADDR_STORAGE)

CHECK_TYPE_SIZE("socklen_t" SOCKLEN_T_EXISTS)
if(SOCKLEN_T_EXISTS)
    set(OMNI_SOCKNAME_SIZE_T socklen_t)
endif()

set(CMAKE_EXTRA_INCLUDE_FILES)

CHECK_INCLUDE_FILES (errno.h HAVE_ERRNO_H)

CHECK_INCLUDE_FILES (fcntl.h HAVE_FCNTL_H)

CHECK_TYPE_SIZE("getaddrinfo" HAVE_GETADDRINFO)

CHECK_TYPE_SIZE("gethostname" HAVE_GETHOSTNAME)

CHECK_TYPE_SIZE("getnameinfo" HAVE_GETNAMEINFO)

CHECK_TYPE_SIZE("getopt" HAVE_GETOPT)

CHECK_TYPE_SIZE("gettimeofday" HAVE_GETTIMEOFDAY)

set(CMAKE_EXTRA_INCLUDE_FILES sys/time.h)
CHECK_TYPE_SIZE("struct timezone" GETTIMEOFDAY_TIMEZONE)
set(CMAKE_EXTRA_INCLUDE_FILES)

CHECK_INCLUDE_FILES (ifaddrs.h HAVE_IFADDRS_H)

CHECK_FUNCTION_EXISTS (inet_ntop HAVE_INET_NTOP)

CHECK_FUNCTION_EXISTS (insinff HAVE_INSINFF)

CHECK_INCLUDE_FILES (inttypes.h HAVE_INTTYPES_H)

CHECK_FUNCTION_EXISTS (isinf HAVE_ISINF)

CHECK_FUNCTION_EXISTS (isinfl HAVE_ISINFL)

CHECK_FUNCTION_EXISTS (IsNANorINF HAVE_ISNANORINF)

CHECK_FUNCTION_EXISTS (localtime HAVE_LOCALTIME)

CHECK_INCLUDE_FILES (memory.h HAVE_MEMORY_H)

CHECK_FUNCTION_EXISTS (nanosleep HAVE_NANOSLEEP)

CHECK_INCLUDE_FILES (nan.h HAVE_NAN_H)

CHECK_INCLUDE_FILES (netdb.h HAVE_NETDB_H)

CHECK_FUNCTION_EXISTS (poll HAVE_POLL)

CHECK_FUNCTION_EXISTS (rand_r HAVE_RAND_R)

CHECK_FUNCTION_EXISTS (sigaction HAVE_SIGACTION)

CHECK_INCLUDE_FILES (signal.h HAVE_SIGNAL_H)

CHECK_FUNCTION_EXISTS (sigvec HAVE_SIGVEC)

CHECK_FUNCTION_EXISTS (snprintf HAVE_SNPRINTF)

CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)

CHECK_INCLUDE_FILES (stdlib.h HAVE_STDLIB_H)

CHECK_FUNCTION_EXISTS (strcasecmp HAVE_STRCASECMP)

CHECK_FUNCTION_EXISTS (strdup HAVE_STRDUP)

CHECK_FUNCTION_EXISTS (strerror HAVE_STRERROR)

CHECK_FUNCTION_EXISTS (strftime HAVE_STRFTIME)

CHECK_FUNCTION_EXISTS (stricmp HAVE_STRICMP)

CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)

CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)

CHECK_FUNCTION_EXISTS (strncasecmp HAVE_STRNCASECMP)

CHECK_FUNCTION_EXISTS (strtoul HAVE_STRTOUL)

CHECK_FUNCTION_EXISTS (strtoull HAVE_STRTOULL)

CHECK_FUNCTION_EXISTS (strtouq HAVE_STRTOUQ)

CHECK_INCLUDE_FILES (sys/if.h HAVE_SYS_IF_H)

CHECK_INCLUDE_FILES (sys/ioctl.h HAVE_SYS_IOCTL_H)

CHECK_INCLUDE_FILES (sys/param.h HAVE_SYS_PARAM_H)

CHECK_INCLUDE_FILES (sys/poll.h HAVE_SYS_POLL_H)

CHECK_INCLUDE_FILES (sys/stat.h HAVE_SYS_STAT_H)

CHECK_INCLUDE_FILES (sys/time.h HAVE_SYS_TIME_H)

CHECK_INCLUDE_FILES (sys/types.h HAVE_SYS_TYPES_H)

CHECK_FUNCTION_EXISTS (uname HAVE_UNAME)

CHECK_INCLUDE_FILES (unistd.h HAVE_UNISTD_H)

CHECK_FUNCTION_EXISTS (vprintf HAVE_VPRINTF)

CHECK_FUNCTION_EXISTS (vsnprintf HAVE_VSNPRINTF)



#/* define if you want to avoid use of alloca */
#/* #undef OMNIORB_DISABLE_ALLOCA */

#/* define if you want to disable long double support */
#/* #undef OMNIORB_DISABLE_LONGDOUBLE */

#/* define if you want mutexes to be traced */
#/* #undef OMNIORB_ENABLE_LOCK_TRACES */

#/* define if you want to disable atomic operations */
#/* #undef OMNI_DISABLE_ATOMIC_OPS */

#/* define if you want to disable IPv6 support */
#/* #undef OMNI_DISABLE_IPV6 */

#/* define if the compiler supports covariant return types */
#define OMNI_HAVE_COVARIANT_RETURNS /**/

#/* define if __sync_add_and_fetch and __sync_sub_and_fetch are available */
#define OMNI_HAVE_SYNC_ADD_AND_FETCH /**/



#/* define if base constructors have to be fully qualified */
#/* #undef OMNI_REQUIRES_FQ_BASE_CTOR */


#/* Define to the type of getsockname's third argument */
#define OMNI_SOCKNAME_SIZE_T socklen_t

#/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "bugs@omniorb-support.com"

#/* Define to the full name of this package. */
#define PACKAGE_NAME "omniORB"

#/* Define to the full name and version of this package. */
#define PACKAGE_STRING "omniORB 4.2.2"

#/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "omniorb"

#/* Define to the home page for this package. */
#define PACKAGE_URL ""

#/* Define to the version of this package. */
#define PACKAGE_VERSION "4.2.2"

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


#/* define if long is the same type as int */
#/* #undef OMNI_LONG_IS_INT */


include(cmake/CheckStackDirection.cmake)
CHECK_STACK_DIRECTION(STACK_DIRECTION)
#/* If using the C implementation of alloca, define if you know the
#direction of stack growth for your system; otherwise it will be
#automatically deduced at runtime.
#STACK_DIRECTION > 0 => grows toward higher addresses
#STACK_DIRECTION < 0 => grows toward lower addresses
#STACK_DIRECTION = 0 => direction of growth unknown */
#/* #undef STACK_DIRECTION */

#/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1
include(cmake/CheckHeaderSTDC.cmake)
CHECK_HEADER_STDC(STDC_HEADERS)

#/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
CHECK_INCLUDE_FILES("sys/time.h;time.h" TIME_WITH_SYS_TIME)
#define TIME_WITH_SYS_TIME 1

#/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
#significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
#/* #  undef WORDS_BIGENDIAN */
# endif
#endif


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


if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "x86_64" OR "${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "AMD64")
    set(PROCESSOR_NAME x86Processor)
    set(PROCESSOR_DEFINE __x86_64__)
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(OSVERSION "2")
    set(PLATFORM_DEFINE "__linux__")
    set(PLATFORM_NAME "Linux")
endif()


if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(OSVERSION "2")
    set(PLATFORM_DEFINE "__linux__")
    set(PLATFORM_NAME "Linux")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    set(OSVERSION "4")
    set(PLATFORM_DEFINE "__NT__")
    set(PLATFORM_NAME "Windows")

endif()


configure_file(include/omniconfig.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/omniconfig.h)
configure_file(include/omniORB4/acconfig_cmake.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/omniORB4/acconfig.h)