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
    Doze

# Pocketmode
PRODUCT_PACKAGES += \
    OneplusPocketMode

# Prebuilt OOS Camera
PRODUCT_PACKAGES += \
    OnePlusCamera \
    OnePlusCameraService

 PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/OnePlus/addon.d/51-oneplus-camera.sh:system/addon.d/51-oneplus-camera.sh \
    $(LOCAL_PATH)/prebuilt/OnePlus/etc/permissions/privapp-permissions-oem.xml:system/etc/permissions/privapp-permissions-oem.xml \
    $(LOCAL_PATH)/prebuilt/OnePlus/lib/libopcameralib-em.so:system/lib/libopcameralib-em.so

# make OOS camera and Alert slider node changeable on OP5's
ifeq ($(TARGET_DEVICE),$(filter $(TARGET_DEVICE),cheeseburger dumpling))
PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*,${LOCAL_PATH}/prebuilt/vendor,$(TARGET_COPY_OUT_VENDOR))
endif

# OnePlus PlayStore permissions for vendor apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.oneplus.software.xml:system/etc/permissions/com.oneplus.software.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.oneplus.software.overseas.xml:system/etc/permissions/com.oneplus.software.overseas.xml

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# Google extra permissions and features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/common/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/google_vr_build.xml:system/etc/sysconfig/google_google_vr_build.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/nexus.xml:system/etc/sysconfig/nexus.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_2017_exclusive.xml:system/etc/sysconfig/pixel_2017_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_2018_exclusive.xml:system/etc/sysconfig/pixel_2018_exclusive.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_experience_2017.xml:system/etc/sysconfig/pixel_experience_2017.xml \
    $(LOCAL_PATH)/prebuilt/common/etc/sysconfig/pixel_experience_2018.xml:system/etc/sysconfig/pixel_experience_2018.xml
