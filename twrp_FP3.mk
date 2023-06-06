#
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    aboot \
    boot \
    cmnlib64 \
    cmnlib \
    devcfg \
    dsp \
    dtbo \
    keymaster \
    lksecapp \
    mdtp \
    modem \
    product \
    rpm \
    sbl1 \
    system \
    tz \
    vbmeta \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.msm8953 \
    bootctrl.msm8953.recovery

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.msm8953 \
#    libcutils \
#    libgptutils \
#    libz

# Time Zone data for recovery
PRODUCT_COPY_FILES += \
    system/timezone/output_data/iana/tzdata:recovery/root/system_root/system/usr/share/zoneinfo/tzdata

# Properties for decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8953 \
    ro.hardware.gatekeeper=msm8953 \
    ro.hardware.bootctrl=msm8953

# Properties for Adoptable Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.allow_encrypt_override=true \
    ro.crypto.volume.filenames_mode=aes-256-cts

# For verification of stock images
PRODUCT_EXTRA_RECOVERY_KEYS := device/fairphone/FP3/releasekey

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := FP3
PRODUCT_NAME := twrp_FP3
PRODUCT_BRAND := Fairphone
PRODUCT_MODEL := FP3
PRODUCT_MANUFACTURER := Fairphone
