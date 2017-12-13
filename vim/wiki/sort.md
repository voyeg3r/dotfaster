# sort.md - Last Change: 2017 dez 13 11:44
+ http://www.theunixschool.com/2012/08/linux-sort-command-examples.html

It is an ordenation command

# Usando o sort dentro do vim

Para ordenar linhas assim:

    Matsumoto  Yukihiro  Ruby   1965  Japan
    Moolenar   Bram      Vim    1961  Netherlands
    Ritchie    Dennis    C      1941  USA
    Stallman   Richard   GNU    1953  USA
    Thompson   Ken       Unix   1943  USA
    Tridgell   Andrew    Samba  1967  Australia
    Wall       Larry     Perl   1954  USA

    :'<,'>!sort -k1

A seleção do vim `'<'>` é ordenada chamando o comando externo `!`
considerando a coluna 1 `k1`

Files with multiple fields and delimiter:
 Let us consider a file with multiple fields:

    $ cat file
    Linux,20
    Unix,30
    AIX,25
    Linux,25
    Solaris,10
    HPUX,100

sorting a file containing multiple fields:

    $ sort file
    AIX,25
    HPUX,100
    Linux,20
    Linux,25
    Solaris,10
    Unix,30

sorting file on the basis of 2nd field , numerically:

    $ sort -t"," -k2n,2 file
    Solaris,10
    Linux,20
    AIX,25
    Linux,25
    Unix,30
    HPUX,100

Remove duplicates from the file based on 1st field:

    $ sort -t"," -k1,1 -u file
    AIX,25
    HPUX,100
    Linux,20
    Solaris,10
    Unix,30
