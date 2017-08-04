
VERSION = 1.2.0
SITE = http://www.nih.at/libzip
SOURCE = libzip-$(VERSION).tar.xz

# depends on zlib
CONF_OPTS += --with-zlib=$(abspath $(DIR_INSTALL))
CONF_OPTS += LIBS=$(abspath $(DIR_INSTALL))/lib/libz.a



include tools/autotools.mk
