
VERSION = 1.6.32
LIBPNG_SERIES = 16
SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(VERSION)
SOURCE = libpng-$(VERSION).tar.xz

CONF_OPTS += CPPFLAGS=-I$(DIR_INSTALL)/include
CONF_OPTS += LDFLAGS="-L$(DIR_INSTALL)/lib"
CONF_OPTS += ZLIBLIB=$(DIR_INSTALL)/lib
CONF_OPTS += ZLIBINC=$(DIR_INSTALL)/include


include tools/common.mk
