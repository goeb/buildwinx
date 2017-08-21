
VERSION = 3.2.1
SITE = http://www.libarchive.org/downloads
SOURCE = libarchive-$(VERSION).tar.gz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)


include tools/common.mk
