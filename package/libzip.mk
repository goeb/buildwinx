
VERSION = 1.2.0
SITE = http://www.nih.at/libzip
SOURCE = libzip-$(VERSION).tar.xz

# depends on zlib
CONF_OPTS += --with-zlib=$(abspath $(DIR_INSTALL))
CONF_OPTS += CFLAGS=-DZIP_STATIC
CONF_OPTS += LIBS="-L$(abspath $(DIR_INSTALL))/lib -lz"



include tools/autotools.mk
