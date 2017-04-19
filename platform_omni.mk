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

# We use stock camera blobs
USE_CAMERA_STUB := true

# cryptfs hw
TARGET_HW_DISK_ENCRYPTION := true

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8952

# Common config
include device/sony/loire-common/platform.mk

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# qseecomd
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/bin/init.qcom.qseecomd.sh:system/bin/init.qcom.qseecomd.sh

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

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

PRODUCT_PROPERTY_OVERRIDES += \
    vidc.dec.downscalar_width=1920 \
    vidc.dec.downscalar_height=1088 \
    media.vpp.enable=true \
    media.msm8956hw=0 \
    ro.vendor.extension_library=libqti-perfd-client.so

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
    tunnel.audio.encode = false \
    audio.deep_buffer.media=true \
    audio.playback.mch.downsample=true \
    use.voice.path.for.pcm.voip=true \
    ro.fm.transmitter=false \
    audio.safx.pbe.enabled=true \
    audio.pp.asphere.enabled=false \
    audio.dolby.ds2.enabled=true

# lib camera shim
PRODUCT_PACKAGES += \
    libshim_wvm

# TWRP
$(call inherit-product, device/sony/loire-common/twrp.mk)
