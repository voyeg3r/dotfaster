# nmcli - Last Change: 2017 dez 01 19:30

nmcli - command-line tool for controlling NetworkManager

# Show current DNS

    nmcli dev show | grep DNS

tags: admin, network

```
# nmcli radio
WIFI-HW  WIFI     WWAN-HW  WWAN
enabled  enabled  enabled  enabled

# nmcli device
DEVICE  TYPE      STATE         CONNECTION
wlan0   wifi      disconnected  --
eth0    ethernet  unavailable   --
lo      loopback  unmanaged     --

Then to actually connect to a wireless AP:

# nmcli device wifi rescan
# nmcli device wifi list
# nmcli device wifi connect SSID-Name password wireless-password
nmcli device wifi connect VIVO-EA31 password 1503016034
```
