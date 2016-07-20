# Full base
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Needed stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Call device specific makefile
$(call inherit-product, device/ark/benefit_m7/benefit_m7.mk)

LOCAL_PATH := device/ark/benefit_m7

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0.1/MOB30M/2419427:user/release-keys PRIVATE_BUILD_DESC="6735-user 6.0.1 MOB30M 2419427 release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="benefit_m7"

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq    
       
PRODUCT_NAME := full_benefit_m7
PRODUCT_DEVICE :=benefit_m7
PRODUCT_BRAND := ark
PRODUCT_MANUFACTURER := mediatek
PRODUCT_MODEL := benefit_m7

DEVICE_RESOLUTION := 720x1280

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# set locales & aapt config.
PRODUCT_LOCALES := ru_RU en_US uk_UA
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Inherit some common CM stuff.

CM_BUILD :=6735

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
#ADDITIONAL_DEFAULT_PROPERTIES += persist.logd.logpersistd=logcatd

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp
	
PRODUCT_PROPERTY_OVERRIDES += \
  service.adb.root=1 \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.root_access=0 \
  persist.sys.usb.config=mtp,adb

$(call inherit-product, vendor/cm/config/common_full_phone.mk)
