#
# This is for TWRP Recovery
#

COMMON_PATH := device/sony/loire-common
TWRP_OUT := recovery/root

TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 4095
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/twrp.fstab:$(TWRP_OUT)/etc/twrp.fstab \
    $(COMMON_PATH)/rootdir/pulldecryptfiles.sh:$(TWRP_OUT)/sbin/pulldecryptfiles.sh

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:$(TWRP_OUT)/system/usr/share/zoneinfo/tzdata
