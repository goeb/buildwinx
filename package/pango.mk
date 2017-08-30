
PANGO_VERSION_MAJOR = 1.40
VERSION = $(PANGO_VERSION_MAJOR).4
SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
SOURCE = pango-$(VERSION).tar.xz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig


include tools/common.mk
