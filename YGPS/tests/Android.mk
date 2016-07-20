LOCAL_PATH:= $(call my-dir)

ifneq ($(filter 6752, $(TARGET_DEVICE)),)

include $(CLEAR_VARS)

# We only want this apk build for tests.
LOCAL_MODULE_TAGS := tests
LOCAL_CERTIFICATE := platform

LOCAL_JAVA_LIBRARIES := android.test.runner
LOCAL_STATIC_JAVA_LIBRARIES := librobotium4

# Include all test java files.
LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := YGPSTests

LOCAL_INSTRUMENTATION_FOR := YGPS

include $(BUILD_PACKAGE)
endif

