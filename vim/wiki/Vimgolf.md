
# Printable ASCII characters
http://www.vimgolf.com/challenges/50b1517e9aad890002000004  vimgolf put 50b1517e9aad890002000004

On this chalenge you have to print nr2char() numbers from 32 to 93

    :set nrformats+=alpha
    :.,$g/^\d/exe "normal! \<C-a>"

# Vertical Limit
+ http://vimgolf.com/challenges/50048db8cdc4060002000004# vimgolf put 50048db8cdc4060002000004

initial file

    There
    is
    no
    vertical
    limit
    for
    vim
    Ninjas

End file

    [ "There", "is", "no", "vertical", "limit", "for", "vim", "Ninjas" ]
