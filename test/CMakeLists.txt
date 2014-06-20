cmake_minimum_required(VERSION 2.8) # We need at least CMake 2.8 or above
project (CM11_KERNEL_TEST)
include(CMakeForceCompiler)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/cmake_includes/)

# We have to configure CMake to use the NDK toolchain.
set (NDK_URL "https://developer.android.com/tools/sdk/ndk/index.html")
set (TOOLCHAIN_PATH "${CMAKE_CURRENT_SOURCE_DIR}/toolchain")

set(ANDROID_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/..")

set (BIN_DIR ${TOOLCHAIN_PATH}/arm-linux-androideabi/bin)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 3)
# set (CMAKE_C_COMPILER ${BIN_DIR}/gcc)
# set (CMAKE_CXX_COMPILER ${BIN_DIR}/g++)
CMAKE_FORCE_C_COMPILER (${BIN_DIR}/gcc GNU)
add_definitions ("--sysroot=${TOOLCHAIN_PATH}/sysroot")
set (CMAKE_PREFIX_PATH ${TOOLCHAIN_PATH}/sysroot/)
include_directories (BEFORE SYSTEM ${CMAKE_PREFIX_PATH}/usr/include)

message(STATUS "SysRoot is ${TOOLCHAIN_PATH}/sysroot" )

set (CMAKE_TRACE true)
set (CMAKE_DEBUG_OUTPUT true)
set (CMAKE_DEBUG_TARGET_PROPERTIES TRUE)

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

set(CMAKE_LIBRARY_PATH_FLAG
    ${CMAKE_LIBRARY_PATH_FLAG} "-mthumb -std=gnu99")

add_subdirectory (system)
