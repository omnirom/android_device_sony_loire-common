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

# Platform path
PLATFORM_COMMON_PATH := device/sony/loire-common

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
include $(PLATFORM_COMMON_PATH)/platform.mk

# GPS
USE_DEVICE_SPECIFIC_GPS := true

PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(PLATFORM_COMMON_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(PLATFORM_COMMON_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(PLATFORM_COMMON_PATH)/gps/etc/lowi.conf:system/etc/lowi.conf \
    $(PLATFORM_COMMON_PATH)/gps/etc/sap.conf:system/etc/sap.conf \
    $(PLATFORM_COMMON_PATH)/gps/etc/xtwifi.conf:system/etc/xtwifi.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm8952 \
    libcurl \
    libgnsspps

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

# lib camera shim
PRODUCT_PACKAGES += \
    libshim_wvm

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

# qseecomd
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/bin/init.qcom.qseecomd.sh:system/bin/init.qcom.qseecomd.sh

# Audio
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

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

PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192 \
    audio.deep_buffer.media=true \
    audio.safx.pbe.enabled=true \
    audio.pp.asphere.enabled=false \
    audio.dolby.ds2.enabled=true \
    audio.playback.mch.downsample=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true

PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=64 \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=false \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.track.enable=true \
    audio.offload.gapless.enabled=true \
    audio.offload.multiple.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    voice.playback.conc.disabled=true \
    voice.record.conc.disabled=false \
    voice.voip.conc.disabled=false \
    voice.conc.fallbackpath=deep-buffer \

PRODUCT_PROPERTY_OVERRIDES += \
    use.voice.path.for.pcm.voip=true \
    use.qti.sw.alac.decoder=true \
    use.qti.sw.ape.decoder=true

PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier \
    media.aac_51_output_enabled=true \
    ro.fm.transmitter=false \
    tunnel.audio.encode = false

# Media HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.dec.downscalar_width=1920 \
    vidc.dec.downscalar_height=1088 \
    media.vpp.enable=true \
    media.msm8956hw=0 \
    ro.vendor.extension_library=libqti-perfd-client.so

# CNE / DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.dpm.feature=1

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    persist.qfp=false

# Enable VDS WFD solution
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.enable_vds=1

# TWRP
$(call inherit-product, $(PLATFORM_COMMON_PATH)/twrp.mk)
