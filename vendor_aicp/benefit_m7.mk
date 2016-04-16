# Inherit some common AICP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/ark/benefit_m7/full_benefit_m7.mk)

PRODUCT_RELEASE_NAME := Ark Benefit M7
PRODUCT_NAME := aicp_benefit_m7

PRODUCT_GMS_CLIENTID_BASE := android-benefit_m7

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=benefit_m7

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="oleg.svs"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280	
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
