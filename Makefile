.SUFFIXES:

# Change this variable or override on the command line to set the 3rdparty package version.
# First 2 numbers correspond to SAFplus release, last number is the rev of this package.
VERSION ?= 6.1.0

ifndef _ARCH
    ARCH := $(shell arch)
endif

ifeq ($(ARCH), x86_64)
    _ARCH := 64
else
    _ARCH := 32
endif

ALLPKGS = $(sort $(wildcard *.zip) $(wildcard *.tgz) $(wildcard *.tar.gz) $(wildcard *.gz))

ARCH_x86_64 = $(wildcard *-x86_64.*) $(wildcard *-x64.*)

ARCH_i686   = $(subst -x64,, $(subst -x86_64,,$(ARCH_x86_64))) $(wildcard *-i586.*) $(wildcard *-i686.*)

PACKAGE_START = 3rdparty-base-$(VERSION)
ifeq ("64", "$(_ARCH)")
    ARCH := x86_64
    tarname = $(PACKAGE_START)-$(ARCH).tar
    md5name = $(PACKAGE_START)-$(ARCH).md5
    DEPS        = $(filter-out $(ARCH_i686), $(ALLPKGS))
else
    tarname = $(PACKAGE_START).tar
    md5name = $(PACKAGE_START).md5
    DEPS        = $(filter-out $(ARCH_x86_64), $(ALLPKGS))
endif

all: $(tarname) $(md5name)

$(tarname): $(DEPS)
	tar cvf $@ $+

$(md5name): $(tarname)
	md5sum $< > $@

clean:
	rm -rf  3rdparty-base-$(version)*.tar rm -rf 3rdparty-base-$(version)*.md5
