
VERSION = 7.54.1
SITE = https://curl.haxx.se/download
SOURCE = curl-$(VERSION).tar.bz2

CONF_OPTS += --with-zlib=$(abspath $(DIR_INSTALL))
CONF_OPTS += --with-ssl=$(abspath $(DIR_INSTALL))
CONF_OPTS += CFLAGS="-DCURL_STATICLIB"
CONF_OPTS += LDFLAGS="-lws2_32"


include tools/autotools.mk
