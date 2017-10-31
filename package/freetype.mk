
VERSION = 2.8
SITE = http://download.savannah.gnu.org/releases/freetype
SOURCE = freetype-$(VERSION).tar.bz2

CONF_OPTS += --with-harfbuzz=no
#CONF_OPTS += ZLIB_LIBS="-L$(DIR_INSTALL) -lz"
#CONF_OPTS += ZLIB_CFLAGS=-I$(DIR_INSTALL)/include
CONF_OPTS += "PKG_CONFIG_LIBDIR=$(DIR_INSTALL)"


include tools/common.mk
