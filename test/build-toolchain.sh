#!/bin/bash

# TODO Use flags instead of environment variables.

if [ ! -n $NDK ]; then
    echo "ERROR: Value of variable \`NDK\` Not set!"
    exit
fi;

if [ ! -n $LEVEL ]; then
    echo "ERROR: Value of variable \`LEVEL\` Not set!"
    exit
fi;

if [ ! -n $ARCH ]; then
    echo "ERROR: Value of variable \`ARCH\` Not set!"
    exit
fi;

SYSROOT=$NDK/platforms/android-$LEVEL/arch-$ARCH/
TOOLCHAIN_DIR=$PWD/toolchain
MAKE_STANDALONE=$NDK/build/tools/make-standalone-toolchain.sh

# TODO auto-complete options and print help.
OPTIONS=(
    "(-p|--ndk-path):SOURCE_PATH:The path to the NDK source (e.g. /opt/ndk)"
    "(-l|--level):LEVEL:The Android APK level you want to use (e.g. 16)."
    "(-a|--arch):ARCH:Your system's architecture (e.g. arm)."
)
 
$MAKE_STANDALONE --platform=android-$LEVEL --install-dir=$TOOLCHAIN_DIR