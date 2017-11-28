# gpg.md - Last Change: 2017 nov 28 13:59
+ https://fedoraproject.org/wiki/Creating_GPG_Keys#ExportGNOME
+ https://superuser.com/a/249516/45032

Encripts and decript files and folders

# Generating keys
Creating GPG Keys Using the Command Line

Use the following shell command:

    gpg2 --full-gen-key


A series of prompts directs you through the process. Press the Enter key to
assign a default value if desired. The first prompt asks you to select what
kind of key you prefer:

# Listing avaiable keys

    gpg --list-keys


To list the secret keys you type:

    gpg --list-secret-keys


# Encripting files and folders
For files(outputs filename.gpg):

    gpg -c filename

For dirs:

    gpg-zip -c -o file.gpg dirname

# Decryption

For files(outputs filename.gpg):

    gpg filename.gpg

For dirs:

    gpg-zip -d file.gpg

# Exporting your public key
This will send your key to the gnupg default key server (keys.gnupg.net), if
you prefer another one use :

    gpg2 --keyserver hkp://pgp.mit.edu --send-key KEYNAME

Copying a Public Key Manually

If you want to give or send a file copy of your key to someone, use this command to write it to an ASCII text file:

    gpg2 --export --armor jqdoe@example.com > jqdoe-pubkey.asc

