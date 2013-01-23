all: installed

BASENAME = shop2-2.9.0
TARNAME = $(BASENAME).tar.gz
TARBALL = $(TARNAME)
TARBALL_URL = http://sourceforge.net/projects/shop/files/$(TARNAME)/download

downloaded: Makefile
	`rospack find rosbuild`/bin/download_checkmd5.py $(TARBALL_URL) $(TARBALL)
	touch downloaded

unpacked: downloaded
	tar xzf $(TARNAME)
	touch unpacked

installed: unpacked
	mkdir asdf
	ln -s ../$(BASENAME)/shop2.asd asdf/shop2.asd
	ln -s ../$(BASENAME)/shop-asd.asd asdf/shop-asd.asd
	ln -s ../$(BASENAME)/shop2-common.asd asdf/shop2-common.asd
	ln -s ../$(BASENAME)/shop2-theorem-prover.asd asdf/shop2-theorem-prover.asd
	ln -s ../$(BASENAME)/shop2-unifier.asd asdf/shop2-unifier.asd
	touch installed

clean:
	rm -rf $(BASENAME) asdf 
	rm -f unpacked installed

wipe: clean
	rm -f $(TARBALL) downloaded

