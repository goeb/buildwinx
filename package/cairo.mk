
VERSION = 1.14.8
SITE = http://cairographics.org/releases
SOURCE = cairo-$(VERSION).tar.xz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig

include tools/common.mk
