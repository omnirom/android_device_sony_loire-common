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

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8952

# Common config
include device/sony/loire-common/platform.mk

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

PRODUCT_PROPERTY_OVERRIDES += \
    vidc.dec.downscalar_width=1920 \
    vidc.dec.downscalar_height=1088 \
    media.vpp.enable=true \
    media.msm8956hw=0 \
    ro.vendor.extension_library=libqti-perfd-client.so

# lib camera shim
PRODUCT_PACKAGES += \
    libshim_wvm

# Copying files
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/twrp.fstab:recovery/root/etc/twrp.fstab

# TWRP
$(call inherit-product, device/sony/loire-common/twrp.mk)
