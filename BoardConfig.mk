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

DEVICE_PATH := device/fairphone/FP3

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8953
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8953

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_serial_dm,0x78af000
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image androidboot.usbconfigfs=true loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

ifeq ($(strip $(TARGET_PREBUILT_KERNEL)),)
TARGET_KERNEL_CONFIG := fp3_twrp_defconfig
TARGET_KERNEL_SOURCE := kernel/fairphone/sdm632
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 52335451136
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_USERIMAGES_USE_EXT4 := true

# Platform
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2030-01-01

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint;ro.build.version.incremental"
PRODUCT_EXTRA_RECOVERY_KEYS := $(DEVICE_PATH)/releasekey
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

# Debug flags
#TWRP_INCLUDE_LOGCAT := true
#TARGET_USES_LOGD := true

# Installer
AB_OTA_UPDATER := true
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := device/fairphone/FP3/installer
