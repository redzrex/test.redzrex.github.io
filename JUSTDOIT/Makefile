ARCHS = armv7 arm64
THEOS_PACKAGE_DIR_NAME = debs
PACKAGE_VERSION = 0.1

include theos/makefiles/common.mk

TWEAK_NAME = JUSTDOIT
JUSTDOIT_FILES = Tweak.xm
JUSTDOIT_FRAMEWORKS = UIKit
JUSTDOIT_PRIVATE_FRAMEWORKS = GraphicsServices

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += switch
SUBPROJECTS += preferences
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"