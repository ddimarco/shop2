all: installed

TARNAME = shop2-2.8.0.tgz
TARBALL = $(TARNAME)
TARBALL_URL = http://sourceforge.net/projects/shop/files/SHOP2/shop2-2.8.0.tgz/download

downloaded: Makefile
	`rospack find rosbuild`/bin/download_checkmd5.py $(TARBALL_URL) $(TARBALL)
	touch downloaded

unpacked: downloaded
	tar xzf $(TARNAME)
	touch unpacked

installed: unpacked
	mkdir asdf
	ln -s ../

installed: unpacked
	mkdir asdf
	ln -s ../shop2-2.8.0/shop2.asd asdf/shop2.asd
	ln -s ../shop2-2.8.0/shop-asd.asd asdf/shop-asd.asd
	ln -s ../shop2-2.8.0/shop2-common.asd asdf/shop2-common.asd
	ln -s ../shop2-2.8.0/shop2-theorem-prover.asd asdf/shop2-theorem-prover.asd
	ln -s ../shop2-2.8.0/shop2-unifier.asd asdf/shop2-unifier.asd
	touch installed

clean:
	rm -rf shop2-2.8.0 asdf 
	rm -f unpacked installed

wipe: clean
	rm -f $(TARBALL) downloaded

