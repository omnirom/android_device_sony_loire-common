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

# Common config
include device/sony/loire-common/platform.mk

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

# Copying files
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/twrp.fstab:recovery/root/etc/twrp.fstab

# Vendor properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw=1300-4911 \
    ro.semc.version.sw_revision=34.2.A.0.311 \
    ro.semc.version.sw_variant=GLOBAL-LTE2A \
    ro.semc.version.sw_type=user \
    ro.semc.version.fs_revision=34.2.A.0.311 \
    ro.semc.ms_type_id=PM-0930-BV \
    ro.semc.version.fs=GENERIC \
    ro.semc.product.name=XperiaX \
    ro.semc.product.device=F51 \
    ro.semc.product.model=F5121 \
    ro.semc.version.cust=OmniROM \
    ro.semc.version.cust_revision=android-7.1

# TWRP
$(call inherit-product, device/sony/loire-common/twrp.mk)
