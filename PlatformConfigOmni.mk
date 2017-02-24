# Copyright 2014 The Android Open Source Project
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

include device/sony/loire-common/PlatformConfig.mk

# We use stock camera blobs
USE_CAMERA_STUB := true

# Do not build keymaster
TARGET_PROVIDES_KEYMASTER := true

# Override the default android_filesystem_config.h
TARGET_ANDROID_FILESYSTEM_CONFIG_H := \
    device/sony/loire-common/include/private/android_filesystem_config.h
