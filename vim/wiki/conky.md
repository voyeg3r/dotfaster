# conky.md - Last Change: 2017 dez 01 07:36
+ https://wiki.archlinux.org/index.php/Conky
+ https://www.lifewire.com/beginners-guide-to-conky-4043352

		sudo pacman -S lm_sensors hddtemp
		yaourt conky-lua acpi
		yaourt conkyforecast

		sudo sensors-detect
		usermod -aG log $(whoami)

# In order to open more than one conky use -d

		conky -d -c ~/config-file

# Getting conky settings

If you already have any conky settings you can see it by typing:

		conky -C

# Get rid of flickering

		conky -d

# Enabling conky at startup (just run these lines)
```zsh
cat <<-EOF> ~/.config/autostart/conky.desktop
# to enable auto startup
# save the above code at
# ~/.config/autostart/conky.desktop
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Conky
Name[en_US]=Conky
Exec=/usr/bin/conky -d -c ~/.dotfiles/conky/conkyrc
Comment[en_US]=
StartupNotify=false
X-GNOME-Autostart-Delay=60
Terminal=false
EOF
```

# Conky themes
+ http://www.mediafire.com/file/5yb5ambg6h4jack/Deluxe_Conky_Theme_Pack.cmtp.7z
+ http://www.mediafire.com/file/icvmpzhlk7vgejt/default-themes-extra-1.cmtp.7z
+ http://www.noobslab.com/2012/07/conky-collection-for-ubuntulinux.html

# Fix window border on gnome-shell
Change "normal" to "desktop"

		own_window_type desktop

