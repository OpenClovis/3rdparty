.SUFFIXES:

ifndef _VERSION
    version := 1.26
else
    version := $(_VERSION)
endif

ifndef _ARCH
    ARCH := $(shell arch)
endif

ALLPKGS = $(sort $(wildcard *.zip) $(wildcard *.tgz) $(wildcard *.tar.gz) $(wildcard *.gz))

ARCH_x86_64 = $(wildcard *-x86_64.*)
ARCH_i686   = $(subst -x86_64,,$(ARCH_x86_64))

ifeq ("64", "$(_ARCH)")
    ARCH := x86_64
    tarname = 3rdparty-base-$(version)-$(ARCH).tar
    md5name = 3rdparty-base-$(version)-$(ARCH).md5
    DEPS        = $(filter-out $(ARCH_i686), $(ALLPKGS))
else
    tarname = 3rdparty-base-$(version).tar
    md5name = 3rdparty-base-$(version).md5
    DEPS        = $(filter-out $(ARCH_x86_64), $(ALLPKGS))
endif

all: $(tarname) $(md5name)

$(tarname): $(DEPS)
	tar cvf $@ $+

$(md5name): $(tarname)
	md5sum $< > $@

clean: 
	rm -rf  $(tarname) $(md5name)
