# git.md - Last Change: 2018 mai 26 15:10
+ https://www.alexkras.com/19-git-tips-for-everyday-use/
+ [primeiros passos](https://git-scm.com/book/pt-br/v1/Primeiros-passos-Uma-Breve-Hist%C3%B3ria-do-Git)


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

# git log

    git log --oneline --graph

# como ver o que mudou em um arquivo

    git log --follow -p --  bin/get-1000-phrases.sh


# Revert a commit, softly

    git revert -n

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

# Download a single folder or directory from a GitHub repo
+ https://stackoverflow.com/questions/7106012

You can use svn for that purpose

Let's say you want download FiraMono from nerd-fonts repo, you have just
to replace `tree/master` with `trunk`

    https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraMono

Protip: You can use svn ls to see available tags and branches before
downloading if you wish

    svn ls https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraMono
    svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraMono


# How to use git with gnome-keyring integration

    sudo apt-get install libgnome-keyring-dev
    cd /usr/share/doc/git/contrib/credential/gnome-keyring
    sudo make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring

Just add these two lines to your ~/.gitconfig file:

    [credential]
        helper = gnome-keyring

# How to save username and password in git
+ https://stackoverflow.com/a/35942890/2571881

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

# List/show git configuration

    git config --list
# Git clone particular version of remote repository
+ https://stackoverflow.com/a/3555202/2571881

    git clone [remote_address_here] my_repo
    cd my_repo
    git reset --hard [ENTER HERE THE COMMIT HASH YOU WANT]

# Desfazendo coisas
## Desfazer alterações em um arquivo

    git checkout -- file


tags: git, github
