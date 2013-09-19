
all:

	@exit 0;

clean:

	@exit 0;

debian/po/templates.pot: debian/templates

	debconf-updatepo	

install: manpage

	mkdir -p $(DESTDIR)/usr/share/quenb/
	mkdir -p $(DESTDIR)/usr/share/man/man1
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/etc/quenb;
	cp quenb-client $(DESTDIR)/usr/bin/
	cp quenb-client.conf $(DESTDIR)/etc/quenb/
	cp quenb-lxde-autostart.conf $(DESTDIR)/usr/share/quenb/
	cp quenb-client.1.gz $(DESTDIR)/usr/share/man/man1/

manpage:
	
	@help2man ./quenb-client --no-info --name="quenb-client: Digital signage display client for Raspberry Pi (or similar systems)" | gzip -c > quenb-client.1.gz

versionbump:
	
	@DEBFULLNAME='ECS STACS' DEBEMAIL='stacs@ecs.soton.ac.uk' dch -v $$(./quenb-client --version)

package: debian/po/templates.pot

	debuild


LATEST := $(shell /bin/ls $$PWD/../quenb-client*.deb | sort -rn | head -1)
REPODIR := "$(PWD)/../../repository/debian"
package-push:

	@echo Pushing $(LATEST) to $(REPODIR)
	@cd $(REPODIR) && reprepro includedeb wheezy $(LATEST)

package-remove:

	@echo Removing quenb-client deb file from repo...
	@cd $(REPODIR) && reprepro remove wheezy quenb-client
