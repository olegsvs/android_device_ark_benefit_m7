$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/ark/benefit_m7/device.mk)

# Release name
PRODUCT_RELEASE_NAME := Ark Benefit M7

EXTENDED_FONT_FOOTPRINT := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Paris

PRODUCT_DEVICE := benefit_m7
PRODUCT_NAME := full_benefit_m7
PRODUCT_BRAND := ark
PRODUCT_MODEL := Ark Benefit M7
PRODUCT_MANUFACTURER := ark
PRODUCT_RESTRICT_VENDOR_FILES := false

# Boot animation
TARGET_SCREEN_HEIGHT      := 1280
TARGET_SCREEN_WIDTH       := 720
TARGET_BOOTANIMATION_NAME := 720

PRODUCT_DEFAULT_LANGUAGE := ru
PRODUCT_DEFAULT_REGION   := RU
