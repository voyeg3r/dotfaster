# dicaslinux.md  - Last Change: 2017 nov 27 13:47

```
Created:	 Qui 09/Mai/2013 hs 09:38
Last Change: 2017 nov 27 13:47
```
# Set keyboard
+ https://edpsblog.wordpress.com/2017/05/16/pequenas-dicas-para-sabayon-e-outros-linux/#more-24739

    setxkbmap -model abnt2 -layout br -variant abnt2

# Restart NetworkManager

    sudo service NetworkManager restart

# Speed Up Slow WiFi Connection In Ubuntu 14.04
+ https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/

## Solution 1: For Slow WiFi in Atheros Wireless Network Adapters

First, you need to find your wireless network adapter. You can do so by using
lshw -C network command in terminal. If your adapter manufacturer is Atheros,
this solution should work for you.

In order to know if you are using atheros just:

    lsmod | grep ath9k

Open a terminal (Ctrl+Alt+T in Ubuntu) and use the following commands one by one:

    sudo su
    echo "options ath9k nohwcrypt=1" >> /etc/modprobe.d/ath9k.conf

# Quick access to the ascii table

		man ascii

# Enabling full-duplex on your Netcard
+ https://www.cyberciti.biz/faq/howto-setup-linux-lan-card-find-out-full-duplex-half-speed-or-mode/

		sudo pacman -S net-tools

# Consertando o /etc/hosts

    [ "`awk 'NR==1 {print $NF}' /etc/hosts`" = "`hostname`" ] && echo '/etc/hosts já está ok!' || \
    sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts

# Colocando a iso do crunchbang em um pendrive

source: http://crunchbang.org/forums/viewtopic.php?id=23267

WARNING, the following instructions will destroy any existing data on your USB stick.

Determine what device your USB is.  With your USB plugged in run:

	sudo ls -l /dev/disk/by-id/*usb*

This should produce output along the lines of:

    lrwxrwxrwx 1 root root  9 2010-03-15 22:54 /dev/disk/by-id/usb-_USB_DISK_2.0_077508380189-0:0 -> ../../sdb
    lrwxrwxrwx 1 root root 10 2010-03-15 22:54 /dev/disk/by-id/usb-_USB_DISK_2.0_077508380189-0:0-part1 -> ../../sdb1

Now cd to where your *.iso is

	cd ~/downloads

ets say the iso is named mini.iso and your USB device is sdb

Example

	sudo dd if=mini.iso of=/dev/sdb bs=4M; sync


