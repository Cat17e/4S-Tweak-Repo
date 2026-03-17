export ARCHS = armv7
# We changed 6.1:6.0 to just 6.1 to help the Robot find it
export TARGET = iphone:clang:6.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 4SPowerTools
4SPowerTools_FILES = Tweak.x
4SPowerTools_FRAMEWORKS = UIKit Foundation
4SPowerTools_LDFLAGS = -lobjc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
