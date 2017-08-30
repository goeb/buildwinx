
GLIB_VERSION_MAJOR = 2.53
VERSION = $(GLIB_VERSION_MAJOR).6
SITE = http://ftp.gnome.org/pub/GNOME/sources/glib/$(GLIB_VERSION_MAJOR)
SOURCE = glib-$(VERSION).tar.xz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig
CONF_OPTS += CFLAGS=-I$(DIR_INSTALL)/include
CONF_OPTS += LDFLAGS="-L$(DIR_INSTALL)/lib -lintl"
CONF_OPTS += --without-pcre

include tools/common.mk
