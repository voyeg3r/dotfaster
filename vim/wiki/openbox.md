# light Linux Desktop environment
+ https://www.cookieshq.co.uk/posts/openbox-a-windows-environment-for-hackers

``` sh
sudo pacman -S openbox obconf obmenu tint2 openbox-themes conky cairo-dock cairo-dock-plug-ins
yaourt --noconfirm obmenu-generator

# A simple program which provides a run program window
sudo pacman -S xcompmgr gmrun
```

``` sh
# Background browser and setter for X windows
sudo pacman -S nitrogen

# Extremely fast and lightweight file manager
sudo pacman -S pcmanfm
```
# Setting up your start
``` sh
sleep 3 xcompmgr -c -f -n & sleep 2 xcompmgr -c -f -n cairo-dock -o &
obmenu-generator -i -s -c
openbox --reconfigure

feh --bg-fill /my/file.jpg
```
