
VERSION = 1.2.12
SITE = http://www.libsdl.org/projects/SDL_mixer/release
SOURCE = SDL_mixer-$(VERSION).tar.gz

#CONF_OPTS += SDL_CFLAGS=-I$(abspath $(DIR_INSTALL))/include/SDL
##CONF_OPTS += LIBS="-L$(abspath $(DIR_INSTALL))/lib -lSDL -lSDLmain"
CONF_OPTS += SDL_CONFIG=$(abspath $(DIR_INSTALL))/bin/sdl-config
CONF_OPTS += --disable-shared

include tools/autotools.mk
