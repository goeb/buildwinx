
VERSION = 2.9.4
SITE = ftp://xmlsoft.org/libxml2
SOURCE = libxml2-$(VERSION).tar.gz

CONF_OPTS += --without-http
CONF_OPTS += --without-python
CONF_OPTS += --without-ftp
CONF_OPTS += CFLAGS="-DLIBXML_STATIC"
CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)


include tools/common.mk
