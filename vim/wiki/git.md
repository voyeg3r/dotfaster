# git.md - Last Change: 2017 nov 27 13:32

# Clonar com submódulos
+ https://stackoverflow.com/a/4438292

    git clone --recursive -j8 https://github.com/voyeg3r/dotfaster.git ~/.dotfiles
    git fetch --recurse-submodules --jobs=8

    ssh -T git@github.com
    var=`echo 3gmail.com@ | sed 's,\(^3\)\(gmail\.com\)\(\@\),voyeg\1r\3\2,g'`
    git config --global user.name voyeg3r
    git config --global merge.tool vimdiff
    git config --global user.email ${var}
    git config --global alias.last 'log -1 HEAD'
    git config --global credential.helper cache
    git config --global push.default simple
    git config --global credential.helper 'cache --timeout=3600'
    git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# update local repo with github updates

    git pull origin master

# Shallow clone

    git clone --depth 1 https://github.com/voyeg3r/dotfiles

# como ver o que mudou em um arquivo

    git log --follow -p --  bin/get-1000-phrases.sh

# acessar uma linha específica de um arquivo do github

    https://github.com/atomaka/dotfiles/blob/master/Makefile#L10

    Como visto acima basta colocar no final da url #Ln  "onde n é
    o número da linha"

# Submódulos

    git submodule add --force https://github.com/zsh-users/zsh-autosuggestions.git

    # after some changes at master
    git pull


Or, if you're a busy person:

    git submodule foreach git pull origin master

# Clonando um repo e também os submódulos em paralelo
+ https://stackoverflow.com/a/34762036/2571881

    git clone --recursive repo
    git fetch --recurse-submodules --jobs=4

# Storing git password

    git config credential.helper store

then

    git pull

provide user-name and password and those details will be remembered later. The
credentials are stored in the disk, with the disk permissions.

if you want to change password later

    git config credential.helper store

then

     git pull

provide new password and it will work like before.
