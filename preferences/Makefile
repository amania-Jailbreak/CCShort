TARGET := iphone:clang:latest:15.0
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
THEOS_PACKAGE_SCHEME = rootless
BUNDLE_NAME = ccshort-preference
ccshort-preference_FILES = CCShortRootListController.m
ccshort-preference_FRAMEWORKS = UIKit
ccshort-preference_PRIVATE_FRAMEWORKS = Preferences
ccshort-preference_INSTALL_PATH = /Library/PreferenceBundles
ccshort-preference_CFLAGS = -fobjc-arc
THEOS_PACKAGE_SCHEME = rootless
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
