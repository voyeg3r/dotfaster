# parted.md - Last Change: qui 02 nov 2017 13:17:04 -03
+ https://linuxadmin.io/using-parted-create-new-swap-disk/

GNU Parted - a partition manipulation program

# General syntaxe

		parted device


In command line mode, this is followed by one or more commands. For example:

		parted /dev/sda resize 1 52 104 mkfs 2 fat16


 If you don't give a parameter to a command, Parted will ask you for it. For example:

		(parted) resize 1
		Start? 0
		End? 400

# Formating to install gentoo

		parted -a optimal /dev/sda

		mklabel gpt .......... creates a gpt partition table
		unit mib  ............ megabits as unit
		mkpart primary 1 3
		name 1 grub
		set 1 grub_bios on
		print

		mkpart primary 3 131
		name 2 boot
