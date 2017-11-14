# conky.md - Last Change: 2017 nov 14 16:35
+ https://wiki.archlinux.org/index.php/Conky

		sudo pacman -S lm_sensors hddtemp
		yaourt conky-lua

		yaourt acpi

# In order to open more than one conky use -d

		conky -d -c ~/config-file

# Enable conky at startup

	 # to enable auto startup
	 # save the above conde at
	 # ~/.config/autostart/conky.desktop

	 [Desktop Entry]
	 Encoding=UTF-8
	 Type=Application
	 Name=Conky
	 Name[en_US]=Conky
	 Exec=/usr/bin/conky
	 Comment[en_US]=
	 StartupNotify=true
	 X-GNOME-Autostart-Delay=60

# Conky themes
+ http://www.mediafire.com/file/5yb5ambg6h4jack/Deluxe_Conky_Theme_Pack.cmtp.7z
+ http://www.noobslab.com/2012/07/conky-collection-for-ubuntulinux.html

# Fix window border on gnome-shell
Change "normal" to "desktop"

		own_window_type desktop

