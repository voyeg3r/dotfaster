# Arquivo: pacman.md - Last Change: 2017 nov 10 13:37
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

