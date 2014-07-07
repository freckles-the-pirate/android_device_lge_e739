# Helpful tutorials on testing the Linux Kernel:
# http://bit.ly/1mRJgao
VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 32
# EXTRAVERSION = .60Kappa-1.6

# Add system-like paths to variables.
TEST_DIR:=$(shell pwd)
ANDROID_ROOT=$(PWD)/..
KERNEL_DIR=$(ANDROID_ROOT)

# Add variables to make the toolchain paths less painful.
TOOLCHAIN_DIR=$(TEST_DIR)/toolchain
VAR_TOOLCHAIN=$(TOOLCHAIN_DIR)/bin/arm-linux-androideabi-

DIR_FS_MGR:=system/core/fs_mgr

# MAKE SETTINGS
# Set the appropriate executables.
# CROSS_COMPILE:=$(VAR_TOOLCHAIN)
CC:=gcc

#### IMPORTANT ####
# If you write a test, add the Makefile to the Makefiles
# 	below.
######
# Compile the test makefiles.
include $(TEST_DIR)/$(DIR_FS_MGR)/Makefile