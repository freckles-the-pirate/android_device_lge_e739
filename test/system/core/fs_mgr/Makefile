
PWD=$(shell pwd)
KERNEL_DIR=$(PWD)/../../../..

obj-m:=$(PWD)/main.c

VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 32
ARCH=ARM
TARGET=fs_mgr


# Typically not set for testing.
# OUT_DIR=/home/jordan/Projects/programming/android/cyanogenmod/11/out

#obj-m := hello.o
#PWD := $(shell pwd)


default:
	cd $(KERNEL_DIR) && \
	$(MAKE) ARCH=arm \
    CROSS_COMPILE=$(PWD)/../toolchain/bin/arm-linux-androideabi- \
    -C $(KERNEL_DIR) \
    SUBDIRS=$(PWD) \
    ARCH=$(ARCH) \
	$(TARGET)

clean:
    $(MAKE) -C $(KERNEL_DIR) \
	SUBDIRS=$(PWD) \
	clean
