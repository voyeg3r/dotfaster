# Converting your debian to sid - Last Change: Nov 24
+ http://www.binarytides.com/enable-testing-repo-debian/
+ https://www.pcsuggest.com/using-debian-as-rolling-release-distribution/
+ https://www.digitalocean.com/community/tutorials/upgrading-debian-to-unstable
+ https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current-live/i386/iso-hybrid/

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
The system upgrade is recommended at runlevel 3, simply without any GUI program running. To do so, logout from the system, press Alt + Ctrl + F2 to open up a virtual tty, then login with your username and password. If you are using a graphical login manager then stop it,

`sudo service sddm stop`
`sudo service gdm stop`
`sudo service xdm stop`

## Then run
`sudo apt-get dist-upgrade`

# Debian unstable repositary
deb http://ftp.us.debian.org/debian/ sid main contrib non-free deb 
http://ftp.us.debian.org/debian/ unstable main contrib non-free

# Cleaning apt cache
+ https://askubuntu.com/a/285692
`sudo apt-get clean`
