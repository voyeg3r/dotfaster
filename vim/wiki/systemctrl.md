# systemctrl.md intro - Last Change: 2017 nov 25 13:03

Local onde ficam os serviços

		ls /etc/init.d/
		
# List runing services

	systemctl list-unit-files | grep enabled

# iniciar/reiniciar um serviço

		systemctrl start nignx.service
		systemctl start org.cups.cupsd.service
		sudo systemctl restart NetworkManager

# Enable service to start on boot time

		systemctrl enable nignx.service
		systemctrl disable nignx.service

		systemctl disable httpd.service

# check if service is on

		systemctrl is-enabled nignx.service

# Check if any systemd services have entered in a failed state:

		systemctl --failed

# Analyze the Boot Process

The systemd-analyze command allows you to view information about your boot
process, such as how long it took and which services (and other processes)
added the most time to the boot process.

## To view information about the startup process in general, run this command:

    systemd-analyze

## To view how long each process took to start, run this command:

    systemd-analyze blame

# Manage Services

To view a list of enabled and disabled services, you use the same systemctl
command as above, but tell it to only list services:

    systemctl list-unit-files –type=service

Halt the machine

		systemctrl halt
		systemctrl reboot

show system log

		journalsystemctl -f
		journalsystemctl --since=today  .......... today's logs

kill a service

		systemctrl kill nignx

other info

		hostnamectl
		timedatectl

[modeline]: # ( vim: set fenc=utf-8 tabstop=4: )
