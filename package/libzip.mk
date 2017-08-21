
VERSION = 1.2.0
SITE = http://www.nih.at/libzip
SOURCE = libzip-$(VERSION).tar.xz

# depends on zlib
CONF_OPTS += --with-zlib=$(DIR_INSTALL)
CONF_OPTS += CFLAGS=-DZIP_STATIC
CONF_OPTS += LIBS="-L$(DIR_INSTALL)/lib -lz"



include tools/common.mk
