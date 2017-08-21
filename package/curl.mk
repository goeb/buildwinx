
VERSION = 7.54.1
SITE = https://curl.haxx.se/download
SOURCE = curl-$(VERSION).tar.bz2

CONF_OPTS += --with-zlib=$(DIR_INSTALL)
CONF_OPTS += --with-ssl=$(DIR_INSTALL)
CONF_OPTS += CFLAGS="-DCURL_STATICLIB"
CONF_OPTS += LDFLAGS="-lws2_32"


include tools/common.mk
