#
# Copyright (C) 2014 The CyanogenMod Project
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

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# DevicHandler
PRODUCT_PACKAGES += \
    DeviceHandler

# Display
PRODUCT_PACKAGES += \
    DisplayMode

# Doze mode
PRODUCT_PACKAGES += \
    OnePlusDoze

# Pocketmode
PRODUCT_PACKAGES += \
    OneplusPocketMode

# init injection for msm8998
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME), msm8998)
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,${LOCAL_PATH}/prebuilt/vendor,$(TARGET_COPY_OUT_VENDOR))
endif

# init injection for sdm845
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME), sdm845)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/init/init.oneplus-sdm.rc:system/etc/init/init.oneplus-sdm.rc
endif

# OnePlus PlayStore permissions for vendor apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.oneplus.software.xml:system/etc/permissions/com.oneplus.software.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.oneplus.software.overseas.xml:system/etc/permissions/com.oneplus.software.overseas.xml

# Hotword Enrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# Google extra permissions and features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml:system/etc/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/default-permissions.xml:system/etc/permissions/default-permissions.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/privapp-permissions-platform.xml:system/etc/permissions/privapp-permissions-platform.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/privapp-permissions-wellbeing.xml:system/etc/permissions/privapp-permissions-wellbeing.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/google_vr_build.xml:system/etc/sysconfig/google_google_vr_build.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/hiddenapi-package-whitelist.xml:system/etc/sysconfig/hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/nexus.xml:system/etc/sysconfig/nexus.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_2016_exclusive.xml:system/etc/sysconfig/pixel_2016_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_2017_exclusive.xml:system/etc/sysconfig/pixel_2017_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_2018_exclusive.xml:system/etc/sysconfig/pixel_2018_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_experience_2017.xml:system/etc/sysconfig/pixel_experience_2017.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_experience_2018.xml:system/etc/sysconfig/pixel_experience_2018.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/wellbeing-hiddenapi-package-whitelist.xml:system/etc/sysconfig/wellbeing-hiddenapi-package-whitelist.xml

# Google extra libraries (sketch/swipe)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    $(LOCAL_PATH)/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so
