all:
	exit 0;

clean:
	exit 0;

install:

	mkdir -p $(DESTDIR)/{usr/share/quenb/,usr/bin,etc/quenb};
	cp quenb-client $(DESTDIR)/usr/bin/
	cp quenb-client.conf $(DESTDIR)/etc/quenb/
	cp quenb-lxde-autostart.conf $(DESTDIR)/usr/share/quenb/
package:
	debuild
