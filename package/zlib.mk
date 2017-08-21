
VERSION = 1.2.11
SITE = http://www.zlib.net
SOURCE = zlib-$(VERSION).tar.xz


define CMD_CONFIGURE
	CC=$(CC) ./configure --prefix=$(DIR_INSTALL) --static
endef

include tools/common.mk
