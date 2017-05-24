ifeq ($(filter-out kugo suzu,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles)

endif
