
VERSION = 8.41
SITE = https://ftp.pcre.org/pub/pcre
SOURCE = pcre-$(VERSION).tar.bz2

CONF_OPTS += "CFLAGS=-DPCRE_STATIC"
CONF_OPTS += --enable-shared=no


include tools/common.mk
