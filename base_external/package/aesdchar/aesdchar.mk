################################################################################
# aesdchar - out-of-tree kernel module package
################################################################################

AESDCHAR_SITE  = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Bhavya-Saravanan.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES  = YES
AESDCHAR_VERSION  = 'c7ba21bf8e37db77c19ff72cda41e66353b59179'

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver



define AESDCHAR_INSTALL_TARGET_CMDS
	
    $(INSTALL) -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra

    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop.sh $(TARGET_DIR)/etc/init.d/S97aesdchar

     

    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
    $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8-buildroot/drivertest.sh $(TARGET_DIR)/usr/bin
	
endef

$(eval $(kernel-module))
$(eval $(generic-package))
