# cower.md - Last Change: 2017 nov 30 13:33
+ https://www.ostechnix.com/cower-simple-aur-helper-arch-linux/

NAME
       cower - a simple AUR downloader

SYNOPSIS
       Usage: cower <operation> [ options ] [ targets ]

DESCRIPTION
       cower is a simple tool to get information and download packages from
       the Arch User Repository (AUR). Invoking cower consists of supplying an
       operation, any applicable options, and usually one or more targets. If
       a target is specified as a lone dash (-), additional targets will be
       read from stdin.

# Installing cower

To install Cower on Arch linux and its derivatives such as Antergos, Manjaro
Linux, run the following commands one by one:

    gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower

    makepkg -i PKGBUILD --noconfirm

# Installing programs
+ https://bbs.archlinux.org/viewtopic.php?id=114157
If I wanted to download Abiword-light and it's dependencies and then build it?
Would I do the following:

    cower -dd abiword-light

Usage

Cower works quite a lot like Pacman, the default package manager of Arch based systems.
The typical usage of Cower is:

    cower <operation> [ options ] [ targets ]

To search for a specific package from AUR using Cower, simply run:

    cower -s <PACKAGE>

Example:

    cower -s vlc

The command will search for the specified target i.e vlc from AUR.

To search multiple packages, specify them space separated as below.

    cower -s <PACKAGE1> <PACKAGE2>

To download specific package, use -d flag as shown below.

    cower -d <PACKAGE>

To view the information of a package, use -i flag.

    cower -i <PACKAGE>

To update all packages, just use -u parameter.

    cower -u

This command will check for updates all installed packages from AUR. You can also specify packages to only check updates for those packages.

    cower -u <PACKAGE>

You can also download updates by passing the -d flag like below.

    cower -ud

For more details, check the man pages.

    man cower
