
# Some build steps may be customized:
#   CMD_CONFIGURE
#   CMD_INSTALL
#   CONF_OPTS
#   SUBDIR_BUILD
#

PKG = $(notdir $(firstword $(MAKEFILE_LIST)))
PKG := $(PKG:%.mk=%)

DIR_PKG_BUILD = $(DIR_BUILD)/$(PKG)-$(VERSION)/$(SUBDIR_BUILD)

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
	@echo "Installing $(PKG)..."
ifeq ($(CMD_INSTALL),)
	$(MAKE) -C $(DIR_PKG_BUILD) install
else
	$(CMD_INSTALL)
endif

build: $(STAMP_CONF) | $(DIR_BUILD)/$(PKG)-$(VERSION)
	@echo "Compiling $(PKG)..."
	$(MAKE) -C $(DIR_PKG_BUILD) \
		-j 2

$(STAMP_CONF): $(STAMP_EXTRACT)
	@echo "Configuring $(PKG)..."
ifeq ($(CMD_CONFIGURE),)
	set -e; \
	cd $(DIR_PKG_BUILD); \
	./configure CXX=$(CXX) CC=$(CC) --host=$(XHOST) --prefix=$(DIR_INSTALL) $(CONF_OPTS)
else
	set -e; \
	cd $(DIR_PKG_BUILD); \
	$(CMD_CONFIGURE)
endif
	touch $(notdir $(STAMP_CONF))

$(STAMP_EXTRACT): $(DIR_DOWNLOAD)/$(SOURCE) | $(DIR_BUILD)
	@echo "Extracting $(PKG)..."
	tar xvf $(DIR_DOWNLOAD)/$(SOURCE) -C $(DIR_BUILD)
	touch $(STAMP_EXTRACT)

$(DIR_DOWNLOAD)/$(SOURCE): | $(DIR_DOWNLOAD)
	@echo "Downloading $(PKG)..."
	cd $(DIR_DOWNLOAD); wget $(SITE)/$(SOURCE)

$(DIR_BUILD) $(DIR_INSTALL) $(DIR_DOWNLOAD):
	mkdir -p $@

clean:
	$(MAKE) -C $(DIR_PKG_BUILD) clean

distclean:
	$(MAKE) -C $(DIR_PKG_BUILD) distclean
	$(RM) $(STAMP_CONF)

