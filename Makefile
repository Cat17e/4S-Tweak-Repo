export ARCHS = armv7
TARGET = iphone:clang:6.1:6.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 4SPowerTools
4SPowerTools_FILES = Tweak.x
4SPowerTools_FRAMEWORKS = UIKit Foundation
4SPowerTools_LDFLAGS = -lobjc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
