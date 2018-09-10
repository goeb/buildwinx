
# buildwinx
Cross Compilation platform using mingw

# Help
```
$ make help
Cleaning:
  clean                  - delete files created by build
  distclean              - delete files created by configure

Package-specific:
  <pkg>                  - Build and install <pkg> and all its dependencies
  <pkg>-download         - Only download the source files for <pkg>
  <pkg>-extract          - Extract <pkg> sources
  <pkg>-configure        - Build <pkg> up to the configure step
  <pkg>-build            - Build <pkg> up to the build step
  <pkg>-install          - Install <pkg>
  <pkg>-dirclean         - Remove <pkg> build directory
  <pkg>-clean            - Clean <pkg> build directory
  <pkg>-distclean        - Distclean <pkg> build directory
  <pkg>-reconfigure      - Restart the build from the configure step
  <pkg>-rebuild          - Restart the build from the build step

Available packages:
  cairo curl freetype gettext glib libarchive libffi libpng libxml2 libzip 
  openssl pango pcre pixman poppler SDL SDL_mixer zlib

Environment:
  CC          : i686-w64-mingw32-gcc
  CXX         : i686-w64-mingw32-g++
  XHOST       : i686-w64-mingw32
  DIR_OUTPUT  : _output
  DIR_BUILD   : _output/build
  DIR_INSTALL : _output/install
  DIR_DOWNLOAD: dl
```
