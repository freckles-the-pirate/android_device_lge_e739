VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 32

# Typically not set for testing.
# OUT_DIR=/home/jordan/Projects/programming/android/cyanogenmod/11/out

#KERNEL_DIR=../../kernel/lge/msm7x30/
KERNEL_DIR=../../

obj-m := hello.o
PWD := $(shell pwd)

default:
	    $(MAKE) ARCH=arm \
			CROSS_COMPILE=../toolchain/bin/arm-linux-androideabi- \
			-C $(KERNEL_DIR) \
			SUBDIRS=$(PWD) \
			all_modules 

clean:
	    $(MAKE) -C $(KERNEL_DIR) \
		SUBDIRS=$(PWD) \
		clean
