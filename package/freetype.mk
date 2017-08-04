
VERSION = 2.8
SITE = http://download.savannah.gnu.org/releases/freetype
SOURCE = freetype-$(VERSION).tar.bz2

CONF_OPTS += --with-harfbuzz=no
CONF_OPTS += ZLIB_LIBS="-L$(abspath $(DIR_INSTALL)) -lz"
CONF_OPTS += ZLIB_CFLAGS=-I$(abspath $(DIR_INSTALL))/include


include tools/autotools.mk
