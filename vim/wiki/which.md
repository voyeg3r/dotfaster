# O comando which é usado para localizar comandos

which python
/usr/bin/python

# Getting a function definition

    which mkcd

output

    mkcd () {
        mkdir -pv -p "$@" && cd $_
    }

Another option

    declare -f mkcd

    mkcd () {
        mkdir -pv -p "$@" && cd $_
    }
