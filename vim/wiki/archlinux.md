# Arquivo: archlinux.wiki - Last Change: 2018 fev 11 14:37

# Automatic updates

[archlinux auto update](rchlinux-auto-update)

# compress or expand executable files

    sudo pacman -S upx

# fix pacman keys

    # pacman-key --init
    # pacman-key --refresh-keys

limpar o cache

    # pacman -Scc

procure outro mirror, edite o arquivo, `/etc/pacman.d/mirrorlist`

# Packages to install on a fresh archlinux installation

    pacman -S net-tools wireless_tools networkmanager wpa_supplicant wpa_actiond netcf dialog

    pacman -S dhclient wifi-menu dialog vim nvim zsh xclip vim neovim curl
    detox aria2 alsa-utils perl perl-rename

    useradd -m -g users -G wheel,storage,power -s /usr/bin/zsh sergio

    pacman -S xorg-server xf86-input-mouse xf86-input-keyboard xf86-video-vesa xorg-xinit

    sudo pacman -S xorg-{iceauth,sessreg,xcmsdb,xbacklight,xgamma,xhost,xinput,xmodmap,xrandr,xrdb,xrefresh,xset,xsetroot}

    sudo pacman -S gnome-shell nautilus gnome-terminal gnome-tweak-tool gnome-control-center xdg-user-dirs gdm

    sudo pacman -S xf86-video-intel

    systemctl enable gdm

    sudo pacman -S firefox curl aria2 detox

    sudo pacman -S pulseaudio pulseaudio-equalizer pavucontrol
    yaourt alsaequal

    sudo pacman -S libcups cups ghostscript gsfonts system-config-printer simple-scan

    Start Deamon
    sudo systemctl enable org.cups.cupsd.service
    sudo systemctl enable cups-browsed.service
    sudo systemctl start org.cups.cupsd.service
    sudo systemctl start cups-browsed.service

Software for HP DeskJet, OfficeJet, inkjet, and Photosmart Printers

sudo pacman -S hplip

# archanywhere our archrevenge
Facilitador para instalaçaõ do archlinux

Durante a instalacao do archlinux, para indicar 32 bits faca:

    sudo linux32 pacstrap /mnt base

+ https://sourceforge.net/projects/obrevenge/files/
+ https://www.ostechnix.com/installing-arch-linux-using-revenge-graphical-installer/

Archrevenge installer: https://sourceforge.net/projects/revenge-installer/
Etcher to make your bootable usb stick: https://etcher.io/

http://arch-anywhere.org/download.html

http://danpla.github.io/fontlink/
https://askubuntu.com/questions/531479/install-fonts-temporarily/623236#623236

# Archmerge - https://archmerge.com/

ArchMerge is a merger of 3 desktop environments. ... The complexity of
the desktops increases gradually but your settings of your applications,
icons, themes and your files move with you from desktop to desktop. Quite an
advantage. ArchMerge will have the number 6.0 or the name Kirk. ArchMerge is a
fork from ArchLabs.

# 32bit
+ https://archlinux32.org/
+ https://archlinux32.org/download/

Transition from the Official Repositories

If you plan to move from the official repositories to [our community maintained](https://mirror.archlinux32.org/i686/)
repositories, follow these steps:

    Put any mirror from our mirrolist into

	/etc/pacman.d/mirrorlist.

Execute

	pacman -Syy archlinux32-keyring-transition

to install our keyring transition package signed by one of the x86_64 archlinux devs.

Run

	pacman -Syuu

for a full transition.

Note, that some packages are currently newer in the official repositories and.
will be downgraded, therefore Also note, that packages found in your package .
cache won't match the signatures from archlinux32 - either allow pacman to   .
delete these cached packages or run pacman -Sc to clean your cache before you.
start and after you finish upgrading                                         .

# Archlinux withou systemd
+ https://artixlinux.org/

# instaling yaourt
+ https://revryl.com/2013/07/11/yaourt-installation-arch-linux/
     sudo vim /etc/pacman.conf.

``` sh
# add this repo:
#
#    [archlinuxfr]
#    SigLevel = Never
#    Server = http://repo.archlinux.fr/$arch
```

     sudo pacman -Sy yaourt

``` sh
yaourt -S extra/python2-gobject2
yaourt -S libappindicator-gtk3
yaourt -S font-manager
```

# pdnsd easy dns cache
https://wiki.archlinux.org/index.php/Pdnsd

# acessando ssh
https://wiki.archlinux.org/index.php/Secure_Shell#Installing_OpenSSH

Configuring SSHD

The SSH daemon configuration file can be found and edited in

    /etc/ssh/sshd_config.

To allow access only for some users add this line:

    AllowUsers    user1 user2

To allow access only for some groups:

    AllowGroups   group1 group2

``` sh
systemctl start sshd.service
systemctl enable sshd.service
```

# configurando o touchpad para colar com toque de dois dedos
[ source: wiki archlinux ](https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Buttonless_TouchPads_.28aka_ClickPads.29)

    /etc/X11/xorg.conf.d/50-synaptics.conf

    sudo cp /usr/share/X11/xorg.conf.d/50-synaptics.conf /etc/X11/xorg.conf.d/

# usando seu pendrive como memória swap

Formate ele usando o gparted depois descubra onde está a partição com o comando

         fdisk -l

Por fim ative a partição assim

         sudo swapon -p 1000 -v /dev/sdc1

a opção -p 1000 aumenta a prioridade de seu uso e opção -v mostra a saída do comando mais detalhada

# delete pacman lock file

    If pacman is not running and has a lock package avoiding
    other instalations, run this:

    rm /var/lib/pacman/db.lck

# updating the system without confirmation

You can create a file ~/.yaourtrc and put this in it:

``` sh
# avoiding many questions during instalation
BUILD_NOCONFIRM=1
EDITFILES=0
```

Another option would be to use the "--noconfirm".

    yaourt --noconfirm -Syua

# enable gdm as default display manager

source: https://bbs.archlinux.org/viewtopic.php?id=151156

    sudo systemctl enable gdm.service -f

 or

    sudo systemctl -f enable gdm

# setting default shell
* reference: http://va.mu/hbcr  (superuser)

    sudo chsh -s $(which zsh) john

# Restasting network

    systemctl restart NetworkManager

    Check whether a unit is already enabled or not:

    systemctl is-enabled unit

# improving network speed

		/etc/sysctl.d/99-sysctl.conf

``` sh
wget -c https://raw.githubusercontent.com/voyeg3r/dotfiles/master/bin/sysctrl.conf -O /etc/sysctl.d/99-sysctrl.conf
```

``` sh
# since v207 /etc/sysctl.conf is no longer parsed, however
# backward compatibility is provided by /etc/sysctl.d/99-sysctl.conf
if [ ! -L /etc/sysctl.d/99-sysctl.conf -a -e /etc/sysctl.conf ]; then
		/usr/bin/ln -sf /etc/sysctl.conf /etc/sysctl.d/99-sysctl.conf || :
fi
```

# stopping services
* https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage

     systemctl disable bluetooth

     systemctl start sshd

# Backlight

When system starts, screen backlight is set to maximum by default. This can be
fixed by specifying backlight level in the following udev rule:

    /etc/udev/rules.d/backlight.rules

** SET BACKLIGHT **

        SUBSYSTEM=="backlight", ACTION=="add", KERNEL=="acpi_video0", ATTR{brightness}="1"

# update firefox-nightly

		yaourt -Syua firefox-nightly

# how restore your usb stick

     dd count=1 bs=512 if=/dev/zero of=/dev/sdx && sync

# how create bootable antergos

    dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx && sync

# yaourt without confirmation
``` sh
config-yaourt(){
[ -f ~/.yaourtrc ] || touch ~/.yaourtrc
cat <<EOF> ~/.yaourtrc

# Yaourt Configuration File

 	# Sun Jan  2 21:04:01 IST 2011

 	#If set to 1, always use the default choice without confirmation.
 	NOCONFIRM=1

 	#If set to 0, don’t propose to edit files (from AUR or from ABS).
 	EDITFILES=0

 	#If 0, disable colors
 	USECOLOR=1
EOF
} && config-yaourt

```
# pacman

 ``` markdown
optimize
acman-optimize && sync

# update
pacman -Syu

pacman -Sy = sincroniza com os repositórios;
pacman -Su = atualiza a distribuição;
pacman -S pacote = instala um pacote;
pacman -R pacote = remove um pacote;
pacman -Rs pacote = remove o pacote junto com as dependências não usadas por outros pacotes;
pacman -Ss pacote = procura por um pacote;
pacman -Sw pacote = apenas baixa o pacote e não o instala;
pacman -Si pacote = mostra informações de um pacote não instalado;
pacman -Qi pacote = mostra informações do pacote já instalado;
pacman -Se pacote = instala apenas as dependências;
pacman -Ql pacote = mostra todos os arquivos pertencentes ao pacote;
pacman -Qu = mostra os pacotes que serão atualizados;
pacman -Q = lista todos os pacotes instalados;
pacman -Qo arquivo = mostra a qual pacote aquele arquivo pertence;
pacman -Sc = deleta do cache todos os pacotes antigos ;
pacman -A arquivo.pkg.tar.gz = instala um pacote local;
pacman -Scc = limpa o cache, em /var/cache/pacman/pkg/.

yaourt commands

yaourt -S package_name – package installation from AUR
yaourt -Ss password – package search
yaourt -Ssq pattern - list packages with pattern
yaourt -Syu –aur – packages and system update using AUR
yaourt -Si package_name – display packages’ information
yaourt -Sc – remove old packages from cache
yaourt -Su – update all AUR packages
yaourt -Sy – get the newest AUR packages database
yaourt -Cd – clean AUR packages database
yaourt -R package_name – remove package

makepkg -sc PKGBUILD
makepkg -sri PKGBUILD

    the option -i means 'install'

-s  instalar dependências caso tiver
-c  limpar arquivos desnecessários após o fim do processo
```

# load keymap (pt-br)

	loadkeys br-abnt2

remover package sem deixar pacotes orfãos

		sudo pacman -Rns packagename

Se você ao remover pacotes não usa o comando acima há grandes chances de que
você tenha algun pacote órfão, para se certificar disto use este comando

		sudo pacman -Qdt

# Para remover todos os pacotes orfãos use o comando

		sudo pacman -Rns $(pacman -Qdtq)

# you can use archbang

Archbang linux brings to you the beste of ArchLinux without pain or boring process of installation

# bash completion=

    pacman -Syu bash-completion

# conky colors -easyer way to config conky
https://aur.archlinux.org/packages/conky-colors/?setlang=pt_BR

# fontes micro$oft
+ https://aur.archlinux.org/packages/ttf-ms-fonts/

# Enable FreeType subpixel hinting mode by editing:
+ https://www.reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily/

		sudo nvim /etc/profile.d/freetype2.sh

Uncomment the desired mode at the end:

		export FREETYPE_PROPERTIES="truetype:interpreter-version=40"

# how use aur packages

Installing packages from the AUR is a relatively simple process. Essentially:

Acquire the tarball which contains the PKGBUILD and possibly other
required files, like systemd-units and patches (but often not the
actual code).  Extract the tarball (preferably in a folder set
aside just for builds from the AUR) with

    tar -xzf foo.tar.gz

Run makepkg in the directory where the files are saved

obs: you must download PKGBUILD

    makepkg -s

the code above will automatically resolve dependencies with pacman). This will
download the code, compile it and pack it.  Look for a README file
in src/, as it might contain information needed later on.  Install
the resulting package with pacman:

     pacman -U /path/to/pkg.tar.xz

# Arch Linux Deprecates /etc/sysctl.conf, User Intervention Required

	pacman -Syu
	mv /etc/sysctl.conf.pacsave /etc/sysctl.d/99-sysctl.conf

    wget -c https://gist.github.com/voyeg3r/368407/raw/ -O /etc/sysctl.d/99-sysctl.conf

# systemd and network interface names
* source: https://wiki.archlinux.org/index.php/Network_Configuration

To keep fixed names to your network card do this file to change:
/etc/udev/rules.d/10-network.rules obs: change the MAC ADDRESS according to
your hardware

    /etc/udev/rules.d/10-network.rules

    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="04:7d:7b:a7:ef:a8", NAME="net0"
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="5c:c9:d3:02:c1:1c", NAME="wifi0"

    ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1480", ATTR{tx_queue_len}="2000"


