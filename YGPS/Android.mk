
LOCAL_PATH:= $(call my-dir)

ifneq ($(filter 6752, $(TARGET_DEVICE)),)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_OVERRIDES_PACKAGES := CMUpdater CMBugReport Screencast

LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_PACKAGE_NAME := YGPS
LOCAL_CERTIFICATE := platform
LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

# Use the folloing include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))

endif