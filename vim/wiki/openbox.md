# light Linux Desktop environment
+ https://www.cookieshq.co.uk/posts/openbox-a-windows-environment-for-hackers
+ https://ramsdenj.com/2016/03/28/building-a-custom-linux-environment-with-openbox.html
+ https://www.youtube.com/watch?v=iI5lRieG5Ko
+ http://openbox.org/wiki/Help:Using_Openbox_in_GNOME
+ https://urukrama.wordpress.com/openbox-guide/
+ https://wiki.archlinux.org/index.php/Conky

# Read aboyt conky-manager here:
+ https://www.youtube.com/watch?v=vyTJ_KD3Ans

``` sh
sudo pacman -S openbox obconf obmenu tint2 openbox-themes conky cairo-dock
cairo-dock-plug-ins feh hddtemp conky
yaourt --noconfirm obmenu-generator conkyforecast yaourt conky-manager
conky-all lm_sensors hddtemp  xdotool conky-lua

sudo chmod +s `which hddtemp`

# A simple program which provides a run program window
# sudo pacman -S xcompmgr gmrun
sudo pacman -S compton gmrun obkey
yaourt obkey
```

``` sh
# Background browser and setter for X windows
sudo pacman -S nitrogen

# Extremely fast and lightweight file manager
sudo pacman -S pcmanfm
```
# Setting up your start
``` sh
obmenu-generator -i -s -c
openbox --reconfigure
compton --config "~/.config/compton.conf"

# feh --bg-fill /my/file.jpg
feh --bg-fill ~/img/new-wallpapers/archlinux-wallpaper-by-voyeg3r.png
pcmanfm --desktop &
sleep 3 && compton -b -c &
cairo-dock -o &
```
You have to create a file called:

				~/.config/openbox/autostart.sh

				nitrogen --restore &
				conky &

# Setting tint2
+ https://wiki.archlinux.org/index.php/tint2#Configuration

				~/.config/tint2/tint2rc


