LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_BOARD_PLATFORM), msm8998)
include $(CLEAR_VARS)
LOCAL_MODULE       := init.oneplus-sdm.rc
#LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/init/init.oneplus-sdm.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/init
include $(BUILD_PREBUILT)
endif
