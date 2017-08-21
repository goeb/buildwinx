
PKG = $(notdir $(firstword $(MAKEFILE_LIST)))
PKG := $(PKG:%.mk=%)
#$(error PKG=$(PKG), MAKEFILE_LIST=$(MAKEFILE_LIST))

# Autotools-related rules

STAMP_CONF = $(DIR_BUILD)/$(PKG)-$(VERSION)/.stamp_conf
STAMP_EXTRACT = $(DIR_BUILD)/$(PKG)-$(VERSION)/.stamp_extract

all: install

download: $(DIR_DOWNLOAD)/$(SOURCE)
extract: $(STAMP_EXTRACT)
configure: $(STAMP_CONF)
dirclean:
	$(RM) -r $(DIR_BUILD)/$(PKG)-$(VERSION)
rebuild: clean all
reconfigure: distclean all


install: build | $(DIR_INSTALL)
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) \
		install

build: $(STAMP_CONF) | $(DIR_BUILD)/$(PKG)-$(VERSION)
	$(MAKE) -C $(DIR_BUILD)/$(PKG)-$(VERSION) \
		-j 2

$(STAMP_CONF): $(STAMP_EXTRACT)
	set -e; \
	cd $(DIR_BUILD)/$(PKG)-$(VERSION); \
	./configure CXX=$(CXX) CC=$(CC) --host=$(XHOST) --prefix=$(abspath $(DIR_INSTALL)) $(CONF_OPTS); \
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


