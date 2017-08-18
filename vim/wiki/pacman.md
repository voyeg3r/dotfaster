
If pacman is not running and has a lock package avoiding
other instalations, run this:

    rm /var/lib/pacman/db.lck

### Fixing pacman database

    pacman-key --init

    pacman-key --populate archlinux antergos

    pacman -Syy

### upgrade all

    sudo pacman -Syyu

### Repeating strings

    sudo pacman -S {,gst-{libav,plugins-{bad,base,good,ugly}}}

### Search packages

    sudo pacman -Ss package-name

### Remove packages

    sudo pacman -R package-name

### Generating a list of all packages

	sudo pacman -Qqe > package_list.txt

	for x in $(cat package_list.txt); do pacman -S $x; done
