
VERSION = 1.2.11
SITE = http://www.zlib.net
SOURCE = zlib-$(VERSION).tar.xz

PKG = $(notdir $(firstword $(MAKEFILE_LIST)))
PKG := $(PKG:%.mk=%)

STAMP_CONF = $(DIR_BUILD)/$(PKG)-$(VERSION)/.stamp_conf
STAMP_EXTRACT = $(DIR_BUILD)/$(PKG)-$(VERSION)/.stamp_extract


# TODO do not duplicate code
all: install

install: build | $(DIR_INSTALL)
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) \
		install \
		DESTDIR=$(abspath $(DIR_INSTALL))

build: $(STAMP_CONF) | $(DIR_BUILD)/$(PKG)-$(VERSION)
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) \
		-j 2

$(STAMP_CONF): $(STAMP_EXTRACT)
	set -e; \
	cd $(DIR_BUILD)/$(PKG)-$(VERSION); \
	CC=$(CC) ./configure --prefix=/ --static; \
	touch $(notdir $(STAMP_CONF))

$(STAMP_EXTRACT): $(DIR_DOWNLOAD)/$(SOURCE) | $(DIR_BUILD)
	tar xvf $(DIR_DOWNLOAD)/$(SOURCE) -C $(DIR_BUILD)
	touch $(STAMP_EXTRACT)

$(DIR_DOWNLOAD)/$(SOURCE): | $(DIR_DOWNLOAD)
	cd $(DIR_DOWNLOAD); wget $(SITE)/$(SOURCE)

$(DIR_BUILD) $(DIR_INSTALL) $(DIR_DOWNLOAD):
	mkdir -p $@

clean:
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) clean

distclean:
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) distclean
	$(RM) $(STAMP_CONF)

