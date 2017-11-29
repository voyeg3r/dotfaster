# pacaur.md - Last Change: 2017-11-29 19:01:02

ArchLinux AUR package management utility

Durante a instalação do pacaur ele pediu duas coisas:

1 - A adição da chave pgp
2 - A necessidade do perl instalado
3 - A necessidade de colocar o `pod2man` no path

Esse tal de pod2man é um programa do perl que tem que estar no path

    sudo find / "pod2man

A chave pgp pode ser adicionada assim:

    gpg --recv-key 1EB2638FF56C0C53








