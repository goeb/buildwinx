
export CC = i686-w64-mingw32-gcc
export CXX = i686-w64-mingw32-g++
export XHOST = i686-w64-mingw32

DIR_OUTPUT ?= _output
export DIR_BUILD ?= $(DIR_OUTPUT)/build
export DIR_INSTALL ?= $(DIR_OUTPUT)/install
export DIR_DOWNLOAD ?= dl

DIR_INSTALL := $(abspath $(DIR_INSTALL))

# the order takes into account dependancies between libs
PKGS =
PKGS += pcre
PKGS += zlib
PKGS += libzip
PKGS += libxml2
PKGS += freetype
PKGS += libpng
PKGS += poppler
PKGS += openssl
PKGS += curl
PKGS += SDL
PKGS += SDL_mixer
PKGS += libarchive
PKGS += libiconv
PKGS += libffi
PKGS += gettext
#PKGS += glib
#PKGS += cairo
#PKGS += pango

.PHONY: $(PKGS)

$(INSTALL_DIR):
	mkdir -p $@

all: $(PKGS)

$(PKGS):
	@echo "Package $@..."
	$(MAKE) -f package/$@.mk

distclean: $(PKGS:%=%-distclean)
clean: $(PKGS:%=%-clean)

# $(1): rule name (eg: configure, clean, rebuild,...)
define pkg-specific-rule
%-$(1):
	$$(MAKE) -f package/$$*.mk $(1)
endef

PKG_SPECIFIC_RULES = \
					 download \
					 extract \
					 configure \
					 build \
					 install \
					 dirclean \
					 clean \
					 distclean \
					 reconfigure \
					 rebuild

$(foreach r,$(PKG_SPECIFIC_RULES),$(eval $(call pkg-specific-rule,$(r))))

help:
	@echo "Cleaning:"
	@echo "  clean                  - delete files created by build"
	@echo "  distclean              - delete files created by configure"
	@echo
	@echo "Package-specific:"
	@echo "  <pkg>                  - Build and install <pkg> and all its dependencies"
	@echo "  <pkg>-download         - Only download the source files for <pkg>"
	@echo "  <pkg>-extract          - Extract <pkg> sources"
	@echo "  <pkg>-configure        - Build <pkg> up to the configure step"
	@echo "  <pkg>-build            - Build <pkg> up to the build step"
	@echo "  <pkg>-install          - Install <pkg>"
	@echo "  <pkg>-dirclean         - Remove <pkg> build directory"
	@echo "  <pkg>-clean            - Clean <pkg> build directory"
	@echo "  <pkg>-distclean        - Distclean <pkg> build directory"
	@echo "  <pkg>-reconfigure      - Restart the build from the configure step"
	@echo "  <pkg>-rebuild          - Restart the build from the build step"
	@echo
	@echo "Available packages:"
	@echo $(PKGS) | xargs -n1 | sort -u | xargs | fold --spaces | sed -e "s/^/  /"
	@echo
	@echo "Environment:"
	@echo "  CC          : $(CC)"
	@echo "  CXX         : $(CXX)"
	@echo "  XHOST       : $(XHOST)"
	@echo "  DIR_OUTPUT  : $(DIR_OUTPUT)"
	@echo "  DIR_BUILD   : $(DIR_BUILD)"
	@echo "  DIR_INSTALL : $(DIR_INSTALL)"
	@echo "  DIR_DOWNLOAD: $(DIR_DOWNLOAD)"


