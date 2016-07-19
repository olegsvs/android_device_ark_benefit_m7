$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/ark/benefit_m7/benefit_m7-vendor.mk)

LOCAL_PATH := device/ark/benefit_m7

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_NAME := ark
PRODUCT_DEVICE := benefit_m7
PRODUCT_BRAND := Ark
PRODUCT_MODEL := Benefit M7

ADDITIONAL_DEFAULT_PROPERTIES += \
ro.adb.secure=0 \
persist.sys.usb.config=mtp \
persist.service.acm.enable=0 \
ro.secure=0 \
ro.allow.mock.location=1 \
ro.debuggable=1 \
ro.zygote=zygote64_32 \
ro.mount.fs=EXT4 \
camera.disable_zsl_mode=1 \
dalvik.vm.dex2oat-Xms=64m \
dalvik.vm.dex2oat-Xmx=512m \
dalvik.vm.image-dex2oat-Xms=64m \
dalvik.vm.image-dex2oat-Xmx=64m \
ro.dalvik.vm.native.bridge=0 \
ro.sf.lcd_density=320
