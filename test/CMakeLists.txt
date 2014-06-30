cmake_minimum_required(VERSION 2.8) # We need at least CMake 2.8 or above
project (CM11_KERNEL_TEST)
include(CMakeForceCompiler)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/cmake_includes/)

############## CROSS-COMPILING CONFIG ###############

# TOOLCHAIN_PATH is the path of the NDK toolchain. See the
#    "if (NOT EXISTS ${TOOLCHAIN_PATH})" construct to see the warning given.
# ANDROID_ROOT is the root of the andoid kernel source, e.g. where you ideally
# ran 'git init'.
set (TOOLCHAIN_PATH "${CMAKE_CURRENT_SOURCE_DIR}/toolchain")
set (ANDROID_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/..")

set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_SYSTEM_VERSION 3)
set (ANDROID TRUE)

# Create lower-case system name for directories.
string (TOLOWER "${CMAKE_SYSTEM_NAME}" SYS_NAME )

# Force the C compiler to use the toolchain.
set (BIN_DIR ${TOOLCHAIN_PATH}/arm-linux-androideabi/bin)
set (CMAKE_C_COMPILER ${BIN_DIR}/gcc)
set (CMAKE_CXX_COMPILER ${BIN_DIR}/g++)

# Force the C coompiler to use 

cmake_force_c_compiler (${BIN_DIR}/gcc GNU)
add_definitions ("--sysroot=${TOOLCHAIN_PATH}/sysroot")

set (CMAKE_PREFIX_PATH ${TOOLCHAIN_PATH}/sysroot/)
include_directories (BEFORE SYSTEM ${CMAKE_PREFIX_PATH}/usr/include)

message(STATUS "SysRoot is ${TOOLCHAIN_PATH}/sysroot" )

# Set version and path information for libraries.
set (GLIBC_VERSION 2.7-4.6)

# Set debugging properties.

set (CMAKE_TRACE true)
set (CMAKE_DEBUG_OUTPUT true)
set (CMAKE_DEBUG_TARGET_PROPERTIES TRUE)
set (CMAKE_VERBOSE_MAKEFILE TRUE)

# Find the toolchain path. If it doesn't exist, tell the user it doesn't
# exist and explain (if need be) what NDK is.
set (NDK_URL "https://developer.android.com/tools/sdk/ndk/index.html")
if (NOT EXISTS ${TOOLCHAIN_PATH})
    message(SEND_ERROR "NDK toolchain directory\n"
        "\t${TOOLCHAIN_PATH}\n"
        "doesn't exist. Try running\n"
        "\t./build-toolchain\n"
        " from ${CMAKE_CURRENT_SOURCE_DIR}/tests first."
        " If you don't know what NDK is,"
        " please go to\n"
        "\t${NDK_URL}.\n"
        "Unfortunately, to read the documentation"
        " you must download the entire package first.")
endif (NOT EXISTS ${TOOLCHAIN_PATH})

set (CMAKE_SHARED_LIBRARY_PREFIX ${ANDROID_ROOT}/core/include)
set (CMAKE_C_IMPLICIT_LINK_DIRECTORIES
    ${TOOLCHAIN_PATH}/sysroot/usr/lib;
    ${TOOLCHAIN_PATH}/sysroot/;
)

set (ARCH_DIR ${CMAKE_SYSTEM_PROCESSOR}-${SYS_NAME})
set (GLIBC_ROOT
    ${ANDROID_ROOT}/prebuilts/gcc/${SYS_NAME}-x86/host/x86_64-${SYS_NAME}-${ARCH_DIR}-glibc${GLIBC_VERSION}/sysroot/usr/include
    ${ANDROID_ROOT}/prebuilts/gcc/${SYS_NAME}-x86/host/i686-${SYS_NAME}-glibc${GLIBC_VERSION}/sysroot/usr/include
)

## !URGENT TODO: glibc discovery

# Right now the glibc root is set manually, so it's only valid for x86_64
# hosts and for glibc version 2.7-4.6

# Trying to construct directory name like x86_64-linux-glibc2.7-4.6
# Since we won't know the version for sure, we need to grep for it.
# TODO: Get the *latest* glibc version.
set (SWAP_H_FILES "$(find -iname 'swap.h' -printf '%p ')")
set (GREP_SWAPON "grep --color=never -l 'int swapon' ${SWAP_H_FILES}")

message (STATUS "Architecture folder pattern: " ${ARCH_DIR})

set (CMD_FIND_GLIBC "${GREP_SWAPON} | grep --color=never ${ARCH_DIR}")

message (STATUS "Running command...\n\t${CMD_FIND_GLIBC}")

set (HOST_DIR '${CMAKE_SYSTEM_PROCESSOR}-${SYS_NAME}-glibc${LIBC_VERSION}/)
set (HOSTED_SYSROOT ${ANDROID_ROOT}/prebuilts/gcc/${HOST_DIR}/sysroot/usr/include/)

# Include directories needed for building
# NOTE, may need to use target_include_directories instead.

set (INC_FS_MGR ${ANDROID_ROOT}/system/core/fs_mgr)
set (INC_SYS_ROOT ${TOOLCHAIN_PATH}}/sysroot)
set (INC_TOOLCHAIN ${TOOLCHAIN_PATH}/sysroot/usr/include/)
set (INC_SYSTEM_CORE ${ANDROID_ROOT}/system/core/include)
set (INC_LOG_WRAPPER ${ANDROID_ROOT}/system/core/logwrapper/include)
set (INC_LG ${ANDROID_ROOT}/kernel/lge/msm7x30/include)

include_directories(BEFORE SYSTEM
    ${INC_FS_MGR}
    ${INC_SYS_ROOT}
    ${INC_TOOLCHAIN}
    ${INC_SYSTEM_CORE}
    ${INC_LOG_WRAPPER}
    ${ING_LG}
    
    ${ANDROID_ROOT}/core/include/
    ${SYS_ROOT}/usr/include
    ${HOSTED_SYSROOT}
    ${GLIBC_ROOT}
)

# If everything is golden, continue adding cross-compile flags.
set(CMAKE_LIBRARY_PATH_FLAG
    ${CMAKE_LIBRARY_PATH_FLAG} " -mthumb -std=gnu99")
    
message (STATUS "CMAKE_LIBRARY_PATH_FLAG = " ${CMAKE_LIBRARY_PATH_FLAG} )

# Finally, go deeper into the system...
add_subdirectory (system)
