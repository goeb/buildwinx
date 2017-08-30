
VERSION = 1.14.8
SITE = http://cairographics.org/releases
SOURCE = cairo-$(VERSION).tar.xz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig
CONF_OPTS += CFLAGS="-I$(DIR_INSTALL)/include"
CONF_OPTS += LDFLAGS="-L$(DIR_INSTALL)/lib -lz"

include tools/common.mk
