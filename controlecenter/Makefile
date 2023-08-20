TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
THEOS_PACKAGE_SCHEME = rootless
BUNDLE_NAME = CCshort-controle
CCshort-controle_BUNDLE_EXTENSION = bundle
CCshort-controle_FILES = CCShort.m
CCshort-controle_CFLAGS = -fobjc-arc
CCshort-controle_FRAMEWORKS = UIKit
CCshort-controle_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CCshort-controle_INSTALL_PATH = /Library/ControlCenter/Bundles/
THEOS_PACKAGE_SCHEME = rootless
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
