LOCAL_PATH := device/6752

MKIMAGE :=  $(LOCAL_PATH)/tools/mkimage
MKBOOTFS := $(LOCAL_PATH)/tools/mkbootfs
MINIGZIP := $(LOCAL_PATH)/tools/minigzip

$(INSTALLED_RAMDISK_TARGET): $(MKIMAGE)
	$(call pretty,"Target ram disk: $@")
	#cp -f $(LOCAL_PATH)/rootdir/root/default.prop $(TARGET_ROOT_OUT)/default.prop
	#cp -f $(LOCAL_PATH)/rootdir/root/init.rc $(TARGET_ROOT_OUT)/init.rc
	$(hide) $(MKBOOTFS) $(TARGET_ROOT_OUT) | $(MINIGZIP) > $@
	$(hide) $(MKIMAGE) $@ ROOTFS > $(PRODUCT_OUT)/ramdisk_android.img
	$(hide) if [ ! -d $(PRODUCT_OUT)/trace32 ]; then mkdir -p $(PRODUCT_OUT)/trace32; fi
	$(hide) mv $@ $(PRODUCT_OUT)/trace32/$(TARGET_PRODUCT)_ramdisk.img
	$(hide) mv $(PRODUCT_OUT)/ramdisk_android.img $@

.PHONY: ramdisk-nodeps
ramdisk-nodeps: $(MKBOOTFS) | $(MINIGZIP)
	@echo "make $@: ignoring dependencies"
	#cp -f $(LOCAL_PATH)/rootdir/root/default.prop $(TARGET_ROOT_OUT)/default.prop
	#cp -f $(LOCAL_PATH)/rootdir/root/init.rc $(TARGET_ROOT_OUT)/init.rc
	$(hide) $(MKBOOTFS) $(TARGET_ROOT_OUT) | $(MINIGZIP) > $(INSTALLED_RAMDISK_TARGET)
	$(hide) $(MKIMAGE) $(INSTALLED_RAMDISK_TARGET) ROOTFS > $(PRODUCT_OUT)/ramdisk_android.img
	$(hide) if [ ! -d $(PRODUCT_OUT)/trace32 ]; then mkdir -p $(PRODUCT_OUT)/trace32; fi
	$(hide) mv $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/trace32/$(TARGET_PRODUCT)_ramdisk.img
	$(hide) mv $(PRODUCT_OUT)/ramdisk_android.img $(INSTALLED_RAMDISK_TARGET)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	#cp -f $(LOCAL_PATH)/rootdir/root/default.prop $(TARGET_ROOT_OUT)/default.prop
	$(hide) $(MKIMAGE) $(TARGET_PREBUILT_INT_KERNEL) KERNEL > $(PRODUCT_OUT)/kernel
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}
			
.PHONY: bootimage-nodeps
bootimage-nodeps: $(MKBOOTIMG)
	@echo "make $@: ignoring dependencies"
	#cp -f $(LOCAL_PATH)/rootdir/root/default.prop $(TARGET_ROOT_OUT)/default.prop
	$(hide) $(MKIMAGE) $(TARGET_PREBUILT_INT_KERNEL) KERNEL > $(PRODUCT_OUT)/kernel	
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$(INSTALLED_BOOTIMAGE_TARGET),$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_INS}"Made boot image: $@"${CL_RST}

