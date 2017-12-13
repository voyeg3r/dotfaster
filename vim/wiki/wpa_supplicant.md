# wpa_supplicant.md - Last Change: qua 13 dez 2017 11:23:36 -03

wpa_supplicant  -
Wi-Fi Protected Access client and IEEE 802.1X suppli‐ cant

    wpa_supplicant -B -i wlp7sO -c <(wpa_passphrase Solutions_Flavio flavio2015)
    dhclient wlp7s0

In order to use wpa_supplicant I have just instaled this:

    pacman -S wireless_tools networkmanager wpa_supplicant wpa_actiond netcf dialog
    pacman -S dhclient
    pacman -S wifi-menu
    pacman -S dialog
    pacman -S vim
    pacman -S nvim
    pacman -S zsh
