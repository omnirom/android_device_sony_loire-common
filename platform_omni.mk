# Copyright (C) 2014 The Android Open Source Project
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

SONY_ROOT = device/sony/loire-common/rootdir

# CAF Stuff
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8952
TARGET_QCOM_MEDIA_VARIANT := caf-msm8952
TARGET_QCOM_AUDIO_VARIANT := caf-msm8952

# GPU
BOARD_USES_ADRENO := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510

# CNE
BOARD_USES_QCNE := true

# We use stock camera blobs
USE_CAMERA_STUB := true

# cryptfs hw
TARGET_HW_DISK_ENCRYPTION := true

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8952

# Common config
include device/sony/loire-common/platform.mk

PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# lib shim
PRODUCT_PACKAGES += \
    libshim_wvm \
    libshim_imsvt

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext \
    rcscommon \
    rcscommon.xml

# Media init
PRODUCT_PACKAGES += \
    init.qcom.early_boot

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8952 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libaudioroute \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libtinycompress \
    tinymix

# Audio
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

# Media HAL
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/media_codecs_8956.xml:system/etc/media_codecs_8956.xml \
    $(SONY_ROOT)/system/etc/media_codecs_8956_v1.xml:system/etc/media_codecs_8956_v1.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance_8956.xml:system/etc/media_codecs_performance_8956.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance_8956_v1.xml:system/etc/media_codecs_performance_8956_v1.xml \
    $(SONY_ROOT)/system/etc/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(SONY_ROOT)/system/etc/media_profiles_8956.xml:system/etc/media_profiles_8956.xml

# qseecomd
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/bin/init.qcom.qseecomd.sh:system/bin/init.qcom.qseecomd.sh

# TWRP
$(call inherit-product, device/sony/loire-common/twrp.mk)
