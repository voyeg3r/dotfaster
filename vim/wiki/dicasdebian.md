# Converting your debian to sid - Last Change: 2017 nov 27 19:12
+ http://www.binarytides.com/enable-testing-repo-debian/
+ https://www.pcsuggest.com/using-debian-as-rolling-release-distribution/
+ https://www.digitalocean.com/community/tutorials/upgrading-debian-to-unstable
+ https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current-live/i386/iso-hybrid/
+ https://debgen.simplylinux.ch/

```
sudo vi /etc/apt/preferences.d/my_preferences
Package: *
Pin: release a=stable
Pin-Priority: 700

Package: *
Pin: release a=testing
Pin-Priority: 650

Package: *
Pin: release a=unstable
Pin-Priority: 600

sudo apt-get clean
```

# Install softwares and upgrade the system
The system upgrade is recommended at runlevel 3, simply without any GUI program
running. To do so, logout from the system, press Alt + Ctrl + F2 to open up a
virtual tty, then login with your username and password. If you are using a
graphical login manager then stop it,

`sudo service sddm stop`
`sudo service gdm stop`
`sudo service xdm stop`

## Then run
`sudo apt-get dist-upgrade`

# Debian unstable repositary (sid)
deb http://ftp.us.debian.org/debian/ sid main contrib non-free deb
http://ftp.us.debian.org/debian/ unstable main contrib non-free

# Cleaning apt cache
+ https://askubuntu.com/a/285692
`sudo apt-get clean`

# Install some metapackages
Run as root

    tasksel

# Install numix-circle
+ https://www.youtube.com/watch?v=1G4XGNHMpNM
+ https://gist.github.com/voyeg3r/fd8c3989d6f5c690e21e1474b950741c

    sudo apt install git docky -y

installnumix (){
    [ -d ~/.icons ] || mkdir ~/.icons
    [ -d ~/.themes ] || mkdir ~/.themes
    cd ~/.themes
    git clone https://github.com/numixproject/numix-gtk-theme.git
    cd ~/.icons
    git clone https://github.com/numixproject/numix-icon-theme.git
    git clone https://github.com/numixproject/numix-icon-theme-circle.git
    cd numix-icon-theme && cp * ..
    cp numix-icon-theme-circle && cp * ..
    gsettings set org.gnome.desktop.interface gtk-theme "Numix"
    gsettings set org.gnome.desktop.wm.preferences theme "Numix"
    gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
} && installnumix

# O que fazer após instalar o debian
+ https://www.youtube.com/watch?v=mifEI1pBx4s
+ https://debgen.simplylinux.ch/

