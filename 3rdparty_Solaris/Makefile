version ?=6.1

ALL_PKGS = $(sort $(wildcard *.zip) $(wildcard *.tgz) $(wildcard *.tar.gz) $(wildcard *.gz))

tarname = 3rdparty-base-$(version)-sun.tar
md5name = 3rdparty-base-$(version)-sun.md5
DEPS    = $(ALL_PKGS)

all: $(tarname) $(md5name)

$(tarname) : $(DEPS)
	tar cvf $@ $+

$(md5name) : $(tarname)
	md5sum $< > $@

clean : 
	rm -rf $(tarname) $(md5name)




