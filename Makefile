all:
	exit 0;

clean:
	exit 0;

install:

	mkdir -p $(DESTDIR)/usr/share/quenb/
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/etc/quenb;
	cp quenb-client $(DESTDIR)/usr/bin/
	cp quenb-client.conf $(DESTDIR)/etc/quenb/
	cp quenb-lxde-autostart.conf $(DESTDIR)/usr/share/quenb/
package:
	debuild
