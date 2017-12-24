# Archlinux automatic update - Last Change: dom 24 dez 2017 17:06:18 -03
+ http://www.techrapid.co.uk/2017/04/automatically-update-arch-linux-with-systemd.html

## Create a systemd service (autoupdate.service) using a text editor such as neovim:
```
sudo nvim /etc/systemd/system/autoupdate.service
Add following to the autoupdate.service:
[Unit]
Description=Automatic Update
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/pacman -Syuq --noconfirm
TimeoutStopSec=180
KillMode=process
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target
```

## Create autoupdate timer

Create a systemd timer or scheduler (autoupdate.timer) using a text editor such
as nano to run the automatic updates periodically (e.g. every 45 minutes):

`sudo nvim /etc/systemd/system/autoupdate.timer`

### Add following to the autoupdate.timer:
```
[Unit]
Description=Automatic Update when booted up after 5 minutes then check the system for updates every 60 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=60min
Unit=autoupdate.service

[Install]
WantedBy=multi-user.target
```

## Enable the autoupdate.timer to automatically run at startup:

`sudo systemctl enable /etc/systemd/system/autoupdate.timer`

## Troubleshooting

Package was broken and corrupted after interrupted install/update

If the automatic update were running when installing a package, but interrupted
after power failure or system crash, then you receive an error when running
pacman (e.g. error: target not found: package). Try to force re-install the
broken or corrupted package then uninstall the package using following
commands:

`sudo pacman -S --force package && sudo pacman -R package`

If you're encountered a conflicting file issue on upgrading process in example
"gd: /directory/file/ exists in filesystem" you can try to force pacman to
upgrade the package:

`sudo pacman -Syu --force`

Note: Use the "--force" command to force package to be removed or upgraded, but
use carefully. If the above steps doesn't work you can try another method from
ArchWiki pacman's guide
