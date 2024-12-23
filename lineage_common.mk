#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/zuma/overlay-lineage

# AiAi Config
PRODUCT_COPY_FILES += \
    device/google/zuma/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# Private signing keys
-include vendor/lineage-priv/keys/keys.mk

# AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions

# EUICC
PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += ro.opa.eligible_device=true

# Google Face Unlock
$(call inherit-product-if-exists, vendor/google/faceunlock/config.mk)

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

# Linker config
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    device/google/zuma/linker.config.json

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Pixel Parts
$(call inherit-product-if-exists, packages/apps/PixelParts/device.mk)

# Quick Tap Stronger Taps
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.columbus.use_ap_sensor=false

# Touch
include hardware/google/pixel/touch/device.mk

# UDFPS
TARGET_HAS_UDFPS := true

# ViperFX
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)

# Basic Call Recorder (BCR)
$(call inherit-product-if-exists, vendor/bcr/bcr.mk)
