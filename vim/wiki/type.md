# type — write a description of command type

Usage example

    type -a mkcd
    mkcd is a shell function from /home/sergio/.dotfiles/zsh/functions.d/mkcd

In order to get a function definition you can type:

    which command

Like in

    which mkcd
    mkcd () {
        mkdir -pv -p "$@" && cd $_
    }
