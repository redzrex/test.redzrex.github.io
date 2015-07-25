ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = JUSTDOIT
JUSTDOIT_FILES = JUSTDOIT.mm
JUSTDOIT_INSTALL_PATH = /Library/PreferenceBundles
JUSTDOIT_FRAMEWORKS = UIKit
JUSTDOIT_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/JUSTDOIT.plist$(ECHO_END)
