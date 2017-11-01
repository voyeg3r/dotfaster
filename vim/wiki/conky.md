# Instro
+ https://wiki.archlinux.org/index.php/Conky

				sudo pacman -S lm_sensors hddtemp
				yaourt conky-lua

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

