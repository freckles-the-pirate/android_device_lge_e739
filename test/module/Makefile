#######
# Helpful Sources:
# Makefile Examples To Compile A Linux Kernel Module
# 		http://bit.ly/1tFlrHO
# Writing and testing Linux kernel modules for Android
# 		http://bit.ly/1mRJgao

obj-m := hello.o
PWD := $(shell pwd)

KERNEL_DIR=$(PWD)/../..
LG_KERNEL_DIR=$(KERNEL_DIR)/kernel/lge
E739_KERNEL_DIR=$(LG_KERNEL_DIR)/e739
MSM_KERNEL_DIR=$(LG_KERNEL_DIR)/msm7x30
TOOLCHAIN_DIR=$(PWD)/../toolchain
TOOLCHAIN_BIN=$(TOOLCHAIN_DIR)/bin/arm-linux-androideabi-

#KERNEL_TO_USE=$(MSM_KERNEL_DIR)
KERNEL_TO_USE=$(E739_KERNEL_DIR)

all:
	make \
		-C $(KERNEL_TO_USE) \
		ARCH=arm \
		CROSS_COMPILE=$(TOOLCHAIN_BIN) \
		SUBDIRS=$(PWD) \
		modules

e739:
	make \
		-C $(KERNEL_TO_USE)
		CROSS_COMPILE=$(TOOLCHAIN_BIN) \
		e739_perf_revd_defconfig && \
		make -C $(KERNEL_TO_USE) \
		ARCH=arm \
		CROSS_COMPILE=$(TOOLCHAIN_BIN)

mrproper:
	cd $(LG_KERNEL_DIR) && \
		make mrproper

clean:
	make \
		-C $(KERNEL_DIR) \
		ARCH=arm \
		CROSS_COMPILE=$(TOOLCHAIN_BIN) \
		m=$(PWD) \
		clean
