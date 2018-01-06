## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := LEM5PRO

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lemfo/LEM5PRO/device_LEM5PRO.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := LEM5PRO
PRODUCT_NAME := lineage_LEM5PRO
PRODUCT_BRAND := w618
PRODUCT_MODEL := LEM5PRO
PRODUCT_MANUFACTURER := Lemfo

#SuperUser
WITH_SU := true
