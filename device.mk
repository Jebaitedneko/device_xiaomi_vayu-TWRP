#
# Copyright 2018 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Display
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

PRODUCT_SHIPPING_API_LEVEL := 30

# Assert
TARGET_OTA_ASSERT_DEVICE := vayu,bhima
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Sec Patch
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_DEVICE_MODULES += libion \
    libandroidicu \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdisplayconfig.qti \
    vendor.qti.hardware.vibrator.service \
    vendor.qti.hardware.vibrator.impl \
    libqtivibratoreffect

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.qti.hardware.vibrator.service

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TW_Y_OFFSET := 91
TW_H_OFFSET := -91
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_EXFAT_FUSE := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

TW_RECOVERY_ADDITIONAL_RELINK_BINARY_FILES += \
    $(TARGET_OUT_EXECUTABLES)/ashmemd
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.base@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so
#TW_USE_KM4 := true

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
#TARGET_RECOVERY_DEVICE_MODULES += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.qti.hardware.vibrator.impl.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libqtivibratoreffect.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/vayu/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so
