
VERSION = 0.55.0
SITE = http://poppler.freedesktop.org
SOURCE = poppler-$(VERSION).tar.xz

CONF_OPTS += --enable-libopenjpeg=none
CONF_OPTS += --disable-libtiff
CONF_OPTS += --disable-libcurl
CONF_OPTS += --disable-libjpeg
CONF_OPTS += --disable-libpng
CONF_OPTS += --disable-splash-output
CONF_OPTS += --disable-cairo-output
CONF_OPTS += --disable-poppler-glib
CONF_OPTS += --disable-gtk-doc-html
CONF_OPTS += --disable-poppler-qt4
CONF_OPTS += --disable-poppler-qt5
CONF_OPTS += --disable-gtk-test
CONF_OPTS += --without-x
CONF_OPTS += --enable-dctdecoder=none
CONF_OPTS += FREETYPE_CFLAGS=-I$(abspath $(DIR_INSTALL))/include
CONF_OPTS += FREETYPE_LIBS="-L$(abspath $(DIR_INSTALL))/lib -lfreetype"


include tools/autotools.mk
