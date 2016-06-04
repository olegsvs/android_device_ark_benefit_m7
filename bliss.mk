# Release name
PRODUCT_RELEASE_NAME := benefit_m7

# Inherit some common BlissPop stuff.
$(call inherit-product, vendor/bliss/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/ark/benefit_m7/device_benefit_m7.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)



TARGET_SCREEN_HEIGHT := 1280	
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := benefit_m7
PRODUCT_NAME := bliss_benefit_m7
PRODUCT_BRAND := ark
PRODUCT_MODEL := benefit_m7
PRODUCT_MANUFACTURER := ark

# BlissPop Configs
BLISSIFY := true
BLISS_O3 := true
BLISS_GRAPHITE := true
BLISS_STRICT := true
BLISS_KRAIT := false
