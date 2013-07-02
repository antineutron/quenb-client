
all:

	@exit 0;

clean:

	@exit 0;

install:

	mkdir -p $(DESTDIR)/usr/share/quenb/
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/etc/quenb;
	cp quenb-client $(DESTDIR)/usr/bin/
	cp quenb-client.conf $(DESTDIR)/etc/quenb/
	cp quenb-lxde-autostart.conf $(DESTDIR)/usr/share/quenb/

package:

	debuild



LATEST := $(shell /bin/ls $$PWD/../quenb-client*.deb | sort -rn | head -1)
REPODIR := "$(PWD)/../../repository/debian"
package-push:

	@echo Pushing $(LATEST) to $(REPODIR)
	@cd $(REPODIR) && reprepro includedeb wheezy $(LATEST)

package-remove:

	@echo Removing quenb-client deb file from repo...
	@cd $(REPODIR) && reprepro remove wheezy quenb-client
