Search vimgolf chalenges to vim users
ao instalar o vimgolf como recomenda o site digite

    gem list

    PATH=$PATH:/home/sergio/.gem/ruby/2.3.0/bin

See also [vimbesttips](vimbesttips.md)

Each vimgolf challenge starts with: http://www.vimgolf.com/challenges/
followed by its unique number

**VimGolf Chalenges**

initial file http://www.vimgolf.com/challenges/59381bd3652ee10dec000005

    milk
    coffe
    toothpaste
    potatoes
    tomatoes
    nuts
    tuna cans

Result

    milk      -->
    coffe     -->
    toothpaste-->
    potatoes  -->
    tomatoes  -->
    nuts      -->
    tuna cans -->

Solution

    <C-v>)A --><ESC>ZZ

Another interesting solution is to enable virtualedit

    :set virtualedit=all

# vimgolf: Simple text editing with vim

    Make the pairs of lines match up by making each second line same as first:

    # Appending text:
    The name "Vim" is an acronym for "Vi IMproved"
    The name "Vim" is an acronym for

    # Editing text:
    Vim is a text editor originally released by Bram Moolenaar in 1991 for the Amiga
    Trivia: Vim is a text editor released by Bram Moolenaar in 1991 for the Amiga

    # Deleting text:
    Vim has a vi compatibility mode
    Vim has a vi compatibility mode but when not in this mode Vim has many enhancements over vi

Solutions: https://stackoverflow.com/a/6680048/2571881

    :g/V/t.|+d<CR>ZZ

On every line that has a "V", copy it down and delete the next line. Write and quit.

    qa3jYjVpq3@aZZ

Seeing the firts solution that uses "V" as a search pattern I ended up asking
me: How to make a search in a range of lines?

    :580,592/Vim/

1 - select the range using v, V or whatever
2 - press ESC to unselect the range
3 - search using /\%Vwhat_to_search to search for 'what_to_search' in the previously selected range.

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

# Interweave two blocks of text
+ http://www.vimgolf.com/challenges/4dcd7b572c8e510001000005
+ vimgolf put 4dcd7b572c8e510001000005

    one
    two
    three
    four
    five
    six
    seven
    eight
    nine
    ten
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

This solution takes 16 keystrokes

    <C-V>M$A<Tab><Esc>gvddM"2PZZ

This one takes only 15 keystrokes

    <C-V>M$A<Tab><Esc>gvd11JPZZ
