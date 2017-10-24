
VERSION = 3.2.1
SITE = http://www.libarchive.org/downloads
SOURCE = libarchive-$(VERSION).tar.gz

CONF_OPTS += PKG_CONFIG_LIBDIR=$(DIR_INSTALL)/lib/pkgconfig
CONF_OPTS += --with-libiconv-prefix="$(DIR_INSTALL)"
CONF_OPTS += LDFLAGS="-liconv -L$(DIR_INSTALL)/lib"


include tools/common.mk
