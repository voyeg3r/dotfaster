# unlok usb drive windows protected
+ https://www.youtube.com/watch?v=Z9A1-NeXfJU
+ https://askubuntu.com/a/138051/3798

First off, run the command `df` to figure out the path of
your usb drive, then run the following command:

		sudo hdparm -r0 /dev/sdb
