
VERSION = 3.2.1
SITE = ftp://sourceware.org/pub/libffi
SOURCE = libffi-$(VERSION).tar.gz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig

include tools/common.mk
