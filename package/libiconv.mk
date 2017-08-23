
VERSION = 1.15
SITE = http://ftpmirror.gnu.org/libiconv
SOURCE = libiconv-$(VERSION).tar.gz

CONF_OPTS += --disable-shared


include tools/common.mk
