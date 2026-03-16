include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 4SPowerTools
4SPowerTools_FILES = Tweak.xm
4SPowerTools_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"