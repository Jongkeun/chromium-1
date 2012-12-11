# Copyright (c) 2012 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This package provides the parts of the WebView java code which live in the
# Chromium tree. This is built into a static library so it can be used by the
# glue layer in the Android tree.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := android_webview_java

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, java/src)

# resource glue layer
LOCAL_SRC_FILES += \
    $(call all-java-files-under, ../content/public/android/java/resource_map)

# contentview and its dependencies
LOCAL_AIDL_INCLUDES := $(LOCAL_PATH)/../content/public/android/java/src
LOCAL_SRC_FILES += \
    $(call all-java-files-under, ../content/public/android/java/src) \
    ../content/public/android/java/src/org/chromium/content/common/ISandboxedProcessCallback.aidl \
    ../content/public/android/java/src/org/chromium/content/common/ISandboxedProcessService.aidl \
    $(call all-java-files-under, ../base/android/java/src) \
    $(call all-java-files-under, ../media/base/android/java/src) \
    $(call all-java-files-under, ../net/android/java/src) \
    $(call all-java-files-under, ../ui/android/java/src) \

# browser components
LOCAL_SRC_FILES += \
    $(call all-java-files-under, \
        ../content/components/web_contents_delegate_android/java/src) \
    $(call all-java-files-under, \
        ../content/components/navigation_interception/java/src) \

# This file is generated by net.gyp:net_errors_java
LOCAL_GENERATED_SOURCES := \
$(call intermediates-dir-for,GYP,shared)/templates/org.chromium.net/NetError.java

include $(BUILD_STATIC_JAVA_LIBRARY)


########################################################
# These packages are the resource paks used by webview.

include $(CLEAR_VARS)
LOCAL_MODULE := webviewchromium_pak
LOCAL_MODULE_STEM := webviewchromium
LOCAL_BUILT_MODULE_STEM := android_webview/assets/webviewchromium.pak
include $(LOCAL_PATH)/webview_pak.mk

# TODO(benm): remove when we get all our strings from java.
include $(CLEAR_VARS)
LOCAL_MODULE := webviewchromium_strings_pak
LOCAL_MODULE_STEM := webviewchromium_strings
LOCAL_BUILT_MODULE_STEM := android_webview/assets/webviewchromium_strings.pak
include $(LOCAL_PATH)/webview_pak.mk
