# Arquivo: pacman.md - Last Change: 2017 nov 19 12:41
Created: sex 08/set/2017 hs 12:58

If pacman is not running and has a lock package preventing
other instalations, run this:

    rm /var/lib/pacman/db.lck

# Fixing pacman database

    pacman-key --init

    pacman-key --populate archlinux antergos

    pacman -Syy

# upgrade all

    sudo pacman -Syyu

# Repeating strings

    sudo pacman -S {,gst-{libav,plugins-{bad,base,good,ugly}}}

# Search packages

    sudo pacman -Ss package-name

# Remove packages
+ https://unix.stackexchange.com/a/10179/3157

    sudo pacman -R package-name

force remove

		sudo pacman -Rdd apache

# Generating a list of all packages

	sudo pacman -Qqe > package_list.txt

	for x in $(cat package_list.txt); do pacman -S $x; done

# Clean pacman cache

		sudo pacman -Sc

# To list the 20 last installed packages with expac, run:

		expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20

# Removing unused packages (orphans)
For recursively removing orphans and their configuration files:

		# pacman -Rns $(pacman -Qtdq)

# Selecting the fastest arch mirror
+ https://www.garron.me/en/go2linux/how-to-find-the-fastest-archlinux-mirrors.html

First install python, as is a python script that will helps us to solve this.

		sudo pacman -S python

Then go to where mirrorlist file is:

		cd /etc/pacman.d/

create a security copy of your mirrorlist file, do it as root

		cp mirrorlist mirrorlist.bak

and run the script as root

		rankmirrors -n 6 mirrorlist.bak > mirrorlist

You may want to have more than six, so -n [m], where m is the number of mirrors you want in your mirrorlist file.

Now, update the pacman's database

		sudo pacman -Syy

This helped me a lot.
