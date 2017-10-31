
VERSION = 0.19.8.1
SITE = http://ftpmirror.gnu.org/gettext
SOURCE = gettext-$(VERSION).tar.xz

SUBDIR_BUILD = gettext-runtime
CONF_OPTS += --disable-shared

include tools/common.mk
