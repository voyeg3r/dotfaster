# dicasdebian.md - Last Change: dom 19 nov 2017 15:45:15 -03

# apt-listbugs

		sudo aptitude install apt-listbugs

# Upgrading to debian sid
+ http://alexander.holbreich.org/debian-to-stretch/

Check if there are problems with packages

First you don't use aptitude anymore, right? Second, you advised to chgeck, that there are no packages "on hold".

		aptitude search "~ahold"

The apt apt-get maintained "hold" packages:

		dpkg --get-selections | grep 'hold'

Now check dpkg problems with

		dpkg --audit

If it shows nothing - everything is fine for now.

## Before upgrading the source list i recoment to install Gnu Keyring of Debian archive.

		apt-get install debian-archive-keyring
		apt-key update

Ok, it seems that system is prepared for upgrade and we are ready to switch release code names from jessie to stretch.

		sed -i 's/jessie/stretch/g' /etc/apt/sources.list
