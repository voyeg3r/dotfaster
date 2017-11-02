# gentoo.md - qui 02 nov 2017 13:28:10 -03

Dicas e instalação do gentoo linux

**Gentoo instalation guide:**
+ Part 1 → https://www.youtube.com/watch?v=13HUQ0LHI7g
+ Part 2 → https://www.youtube.com/watch?v=9mD6aAG7DNA
+ Portuguese → https://www.youtube.com/watch?v=BD1wIoX0E2c

# Handbook para x86
+ https://wiki.gentoo.org/wiki/Handbook:X86/Installation

Try at fist `ifconfig` or `ip addr`

Now test your connection:

		root # ping -c 3 www.gentoo.org

# Default: Using net-setup

The simplest way to set up networking if it didn't get configured automatically is to run the net-setup script:

		root # net-setup eth0

Or using dhcp

		dhcpcd eth0

When using a wireless (802.11) card, the wireless settings need to be
configured before going any further. To see the current wireless settings on
the card, one can use iw. Running iw might show something like:

		root # iw dev wlp9s0 info

# Partitioning

Default: Using parted to partition the disk

In this chapter, the example partition layout mentioned earlier in the
instructions will be used:

		Partition 	Description
		/dev/sda1 	BIOS boot partition
		/dev/sda2 	Boot partition
		/dev/sda3 	Swap partition
		/dev/sda4 	Root partition

# # Stating partitioning

		root # parted -a optimal /dev/sda

		GNU Parted 2.3
		Using /dev/sda
		Welcome to GNU Parted! Type 'help' to view a list of commands.

		mklabel gpt

To have the disk with MBR layout, use mklabel msdos.

# # Removing all partitions with parted

If this isn't done yet (for instance through the mklabel operation earlier,
or because the disk is a freshly formatted one) , first remove all existing
partitions from the disk. Type print to view the current partitions, and rm
<N> where <N> is the number of the partition to remove.

		(parted) rm 2

Do the same for all other partitions that aren't needed. However, make sure to
not make any mistakes here - parted executes the changes immediately (unlike
fdisk which stages them, allowing a user to "undo" his changes before saving
or exiting fdisk) .

First, tell parted that the size unit we work with is megabytes (actually
mebibytes, abbreviated as MiB which is the "standard" notation, but we will
use MB in the text throughout as it is much more common) :

		(parted) unit mib


Now create a 2 MB partition that will be used by the GRUB2 boot loader later.
Use the mkpart command for this, and inform parted to start from 1 MB and end
at 3 MB (creating a partition of 2 MB in size) .

		(parted) mkpart primary 1 3
		(parted) name 1 grub
		(parted) set 1 bios_grub on
		(parted) print

		Model: Virtio Block Device (virtblk)
		Disk /dev/sda: 20480MiB
		Sector size (logical/physical) : 512B/512B
		Partition Table: gpt

		Number   Start      End      Size     File system  Name   Flags
		 1       1.00MiB    3.00MiB  2.00MiB               grub   bios_grub

Do the same for the boot partition (128 MB) , swap partition (in the example,
512 MB) and the root partition that spans the remaining disk (for which the
end location is marked as -1, meaning the end of the disk minus one MB, which
is the farthest a partition can go) .

		(parted) mkpart primary 3 131
		(parted) name 2 boot
		(parted) mkpart primary 131 643
		(parted) name 3 swap
		(parted) mkpart primary 643 -1
		(parted) name 4 rootfs


When using the UEFI interface to boot the system (instead of BIOS) , mark the
boot partition as the EFI System Partition. Parted does this automatically
when the boot option is set on the partition:

		(parted) set 2 boot on

		The end result looks like so:
		(parted) print

		Model: Virtio Block Device (virtblk)
		Disk /dev/sda: 20480MiB
		Sector size (logical/physical) : 512B/512B
		Partition Table: gpt

		+----------------------------------------------------------------------+
		| Number   Start      End      Size     File system  Name   Flags      |
		+----------------------------------------------------------------------+
		|  1       1.00MiB    3.00MiB  2.00MiB               grub   bios_grub  |
		|  2       3.00MiB    131MiB   128MiB                boot   boot       |
		|  3       131MiB     643MiB   512MiB                swap              |
		|  4       643MiB     20479MiB 19836MiB              rootfs            |
		+--------------------------------------------------------------------- +

For instance, to have the boot partition (/dev/sda2) in ext2 and the root partition (/dev/sda4) in ext4 as used in the example partition structure, the following commands would be used:

		root # mkfs.ext2 /dev/sda2
		root # mkfs.ext4 /dev/sda4

Now create the filesystems on the newly created partitions (or logical volumes).
Activating the swap partition

mkswap is the command that is used to initialize swap partitions:

		root # mkswap /dev/sda3

To activate the swap partition, use swapon:

		root # swapon /dev/sda3

Create and activate the swap with the commands mentioned above.

Mounting the root partition

Now that the partitions are initialized and are housing a filesystem, it is
time to mount those partitions. Use the mount command, but don't forget to
create the necessary mount directories for every partition created. As an
example we mount the root partition:

		root # mount /dev/sda4 /mnt/gentoo

# Installation Stage

# # Installing a stage tarball
Setting the date and time

Before installing Gentoo, it is a good idea to be sure the date and time are
set correctly. A mis-configured clock may lead to strange results: base system
files should be extracted with accurate time stamps. In fact, due to several
websites and services using encrypted communications (SSL/TLS), it might not
be possible to download the installation files at all if the system clock is
too far skewed!

Verify the current date and time by running the date command:

		root # date

		Mon Oct  3 13:16:22 PDT 2016

If the date/time displayed is wrong, update it using one of the methods below.

For instance, to set the date to October 3rd, 13:16 in the year 2016:

		root # date 100313162016

# Downloading the stage tarball

Go to the Gentoo mount point where the root file system is mounted (most likely /mnt/gentoo):

		root # cd /mnt/gentoo

Downloading stage3

		root # links https://www.gentoo.org/downloads/mirrors/

		root # tar xvjpf stage3-*.tar.bz2 --xattrs --numeric-owner

# Configuring compile options
Fire up an editor (in this guide we use nano) to alter the optimization
variables we will discuss hereafter.

		root # nano -w /mnt/gentoo/etc/portage/make.conf
