prefix=/usr/local
DESTDIR=
BUILDDIR=build
BINDIR=$(prefix)/bin
LIBEXECDIR=$(prefix)/lib

GITHGEXECDIR=$(LIBEXECDIR)/git-hg
FASTEXPORTDIR=$(GITHGEXECDIR)/fast-export

INSTALL=/usr/bin/install -c
SED=/bin/sed

GITHG_S=bin/git-hg
GITHG_F=$(BUILDDIR)/git-hg
HGFE_D=fast-export
HGFE_F=$(HGFE_D)/hg-fast-export.sh $(HGFE_D)/hg-fast-export.py $(HGFE_D)/hg2git.py

all: $(GITHG_F) $(HGFE_F)

clean:
	rm -rf $(BUILDDIR)

$(GITHG_F): $(GITHG_S)
	mkdir -p $(BUILDDIR)
	$(SED) -e '/^GITHG_HOME=/s:=.*:='"'$(GITHGEXECDIR)'"':' $< > $@

$(HGFE_F):
	git submodule update --init

install: 
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -m 755 $(GITHG_F) $(DESTDIR)$(BINDIR)/
	$(INSTALL) -d $(DESTDIR)$(FASTEXPORTDIR)
	$(INSTALL) -m 755 $(HGFE_F) $(DESTDIR)$(FASTEXPORTDIR)/

