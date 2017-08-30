
VERSION = 1.0.2l
SITE = http://www.openssl.org/source
SOURCE = openssl-$(VERSION).tar.gz

define CMD_INSTALL
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) install_sw
endef

define CMD_CONFIGURE
	CC=$(CC) ./Configure no-asm mingw --prefix=$(DIR_INSTALL)
endef

include tools/common.mk

