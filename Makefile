
export CC = i686-w64-mingw32-gcc
export CXX = i686-w64-mingw32-g++
export XHOST = i586-mingw32msvc

export DIR_OUTPUT ?= _output
export DIR_BUILD ?= $(DIR_OUTPUT)/build
export DIR_INSTALL ?= $(DIR_OUTPUT)/install
export DIR_DOWNLOAD ?= dl

# the order takes into account dependancies between libs
PKGS =
PKGS += pcre
PKGS += zlib
PKGS += libzip
PKGS += libxml2
PKGS += freetype
PKGS += libpng
PKGS += poppler

.PHONY: $(PKGS)

$(INSTALL_DIR):
	mkdir -p $@

all: $(PKGS)

$(PKGS):
	@echo "Package $<..."
	$(MAKE) -f package/$@.mk

print:
	@echo PKGS=$(PKGS)
	@echo DESTDIR=$(abspath $(DIR_INSTALL))

