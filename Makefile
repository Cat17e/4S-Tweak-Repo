export ARCHS = armv7
export TARGET = iphone:clang:latest:6.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 4SPowerTools
4SPowerTools_FILES = Tweak.x
4SPowerTools_FRAMEWORKS = UIKit
4SPowerTools_LDFLAGS = -lsqlite3 -lz

include $(THEOS_MAKE_PATH)/tweak.mk
