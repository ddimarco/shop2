all: shop2

TARNAME = shop2-2.8.0.tgz
TARBALL = build/$(TARNAME)
TARBALL_URL = http://sourceforge.net/projects/shop/files/SHOP2/shop2-2.8.0.tgz/download
SOURCE_DIR = build/shop2-2.8.0
MD5SUM_FILE = shop2-2.8.0.md5sum
UNPACK_CMD = tar xzf
include $(shell rospack find mk)/download_unpack_build.mk

shop2: $(SOURCE_DIR)/unpacked
	mkdir -p src
	cp -r $(SOURCE_DIR)/* src/

clean:
	-rm -rf src $(SOURCE_DIR) shop2

wipe: clean
	-rm -rf build
