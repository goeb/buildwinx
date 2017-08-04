
VERSION = 1.6.31
LIBPNG_SERIES = 16
SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(VERSION)
SOURCE = libpng-$(VERSION).tar.xz

CONF_OPTS += CPPFLAGS=-I$(abspath $(DIR_INSTALL))/include
CONF_OPTS += LDFLAGS="-L$(abspath $(DIR_INSTALL))/lib"
CONF_OPTS += ZLIBLIB=$(abspath $(DIR_INSTALL))/lib
CONF_OPTS += ZLIBINC=$(abspath $(DIR_INSTALL))/include


include tools/autotools.mk
