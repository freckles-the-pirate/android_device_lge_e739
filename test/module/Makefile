VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 32
ARCH=ARM
TARGET=modules

obj-m := hello.o
PWD := $(shell pwd)

OUT_DIR := $(PWD)

KERNEL_DIR=$(PWD)/../..

default:
	cd $(KERNEL_DIR) && \
	$(MAKE) ARCH=arm \
    CROSS_COMPILE=$(PWD)/../toolchain/bin/arm-linux-androideabi- \
    -C $(KERNEL_DIR) \
    SUBDIRS=$(PWD) \
    ARCH=$(ARCH) \
	$(TARGET)

listtargets:
	@echo "$(call module-names-for-tag-list,$(ALL_MODULE_TAGS))" | \
  tr -s ' ' '\n' | sort -u | $(COLUMN)

clean:
    $(MAKE) -C $(KERNEL_DIR) \
	SUBDIRS=$(PWD) \
	clean
