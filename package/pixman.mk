
VERSION = 0.34.0
SITE = http://xorg.freedesktop.org/releases/individual/lib
SOURCE = pixman-$(VERSION).tar.bz2

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig
CONF_OPTS += --disable-gtk

include tools/common.mk
