LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PACKAGE_NAME := ClockSkinCoco
LOCAL_MODULE := ClockSkinCoco
LOCAL_SRC_FILES := app/$(LOCAL_MODULE).apk
LOCAL_PREBUILT_JNI_LIBS := lib/libcocos2dlua.so
LOCAL_MODULE_TARGET_ARCH := arm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
