
VERSION = 1.2.12
SITE = http://www.libsdl.org/projects/SDL_mixer/release
SOURCE = SDL_mixer-$(VERSION).tar.gz

CONF_OPTS += SDL_CONFIG=$(DIR_INSTALL)/bin/sdl-config
CONF_OPTS += --disable-shared

include tools/common.mk
