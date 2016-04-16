$(call inherit-product, device/ark/benefit_m7/full_benefit_m7.mk)

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := benefit_m7
PRODUCT_NAME := full_benefit_m7
PRODUCT_BRAND := ark
PRODUCT_MODEL := Ark Benefit M7
PRODUCT_MANUFACTURER := ark
