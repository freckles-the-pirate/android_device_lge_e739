# Helpful tutorials on testing the Linux Kernel:
# http://bit.ly/1mRJgao
VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 32
EXTRAVERSION = .60Kappa-1.6

PWD:=$(shell pwd)
ANDROID_ROOT=$(PWD)/..

#KERNEL_DIR=$(ANDROID_ROOT)/kernel/lge/msm7x30
KERNEL_DIR=$(ANDROID_ROOT)

# Add variables to make the toolchain paths less painful.
TOOLCHAIN_DIR=$(TEST_DIR)/test/toolchain
VAR_TOOLCHAIN=$(TOOLCHAIN_DIR)/bin/arm-linux-android-eabi-

DIR_FS_MGR:="system/core/fs_mgr"

#include "$(PWD)/$(DIR_SF_MGR)/Makefile"

obj-m := $(PWD)/$(DIR_SF_MGR)/main.c
default:
	    $(MAKE) ARCH=arm CROSS_COMPILE=$(VAR_TOOLCHAIN)- -C $(KERNEL_DIR) SUBDIRS=$(PWD) modules
clean:
	    $(MAKE) -C $(KERNEL_DIR) SUBDIRS=$(PWD) clean
