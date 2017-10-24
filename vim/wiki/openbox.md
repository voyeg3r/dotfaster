# light Linux Desktop environment
+ https://www.cookieshq.co.uk/posts/openbox-a-windows-environment-for-hackers
+ https://ramsdenj.com/2016/03/28/building-a-custom-linux-environment-with-openbox.html
+ https://www.youtube.com/watch?v=iI5lRieG5Ko

``` sh
sudo pacman -S openbox obconf obmenu tint2 openbox-themes conky cairo-dock cairo-dock-plug-ins
yaourt --noconfirm obmenu-generator

# A simple program which provides a run program window
# sudo pacman -S xcompmgr gmrun
sudo pacman -S compton gmrun obkey
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

feh --bg-fill /my/file.jpg
pcmanfm --desktop &
sleep 3  compton -b -c
cairo-dock -o &
```
