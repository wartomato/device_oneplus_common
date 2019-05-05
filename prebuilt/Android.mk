LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME), sdm845)
  include $(CLEAR_VARS)
  LOCAL_MODULE       := init.oneplus-sdm.rc
  LOCAL_MODULE_TAGS  := optional eng userdebug
  LOCAL_MODULE_CLASS := ETC
  LOCAL_SRC_FILES    := rootdir/etc/init.oneplus-sdm.rc
  LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/init
  include $(BUILD_PREBUILT)
endif
