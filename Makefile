TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

TWEAK_NAME = CCShort
THEOS_PACKAGE_SCHEME = rootless
CCApps_CFLAGS = -fobjc-arc
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += controlecenter
SUBPROJECTS += preferences
include $(THEOS_MAKE_PATH)/aggregate.mk
