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

    <C-V> ......... visual block
    M ............. middle of screen
    $ ............. end of block
    TAB ........... literal TAB
    <Esc> ......... exit insert mode
    gv ............ reselects visual
    d ............. take selection to default register
    11J ........... erase blank lines by joining them
    P ............. paste default register

# multiple cursor alternative

Start file

    <section class="top-bar-selection">
      <ul class="left">
        <li class="divider"></li>
        <li class="active">
          <a href="homepage.html">Page 1</a></li>
        <li class="divider"></li>
        <li>
          <a href="homepage.html">Page 2</a></li>
        <li class="divider"></li>
        <li>
          <a href="homepage.html">Page 3</a></li>
        <li class="divider"></li>
        <li>
          <a href="homepage.html">Page 4</a></li>
      </ul>
    </section>

End file

    <section class="top-bar-selection">
      <ul class="left">
        <li class="divider"></li>
        <li class="active">
          <a href="Page1.html">Page 1</a></li>
        <li class="divider"></li>
        <li>
          <a href="Page2.html">Page 2</a></li>
        <li class="divider"></li>
        <li>
          <a href="Page3.html">Page 3</a></li>
        <li class="divider"></li>
        <li>
          <a href="Page4.html">Page 4</a></li>
      </ul>
    </section>

This solution spends 19 keystrokes

    :%norm yitTgvbpX<CR>ZZ

    :% ............. whole file
    norm ........... normal mode
    yit ............ yank inner tag
    Tg ............. till before back g
    v .............. visual
    b .............. beggining
    p .............. paste
    X .............. erase last char
    ZZ ............. save and exit

OBS: The "yit" (used to copy inner tag) only works on tags
     that have any text.

# Just the middle
+ vimgolf put 54862fbb3f90ac0002904cf5

Start file

    Leave only the
    numbered lines.
    LINE 1
    LINE 2
    LINE 3
    That's all.
    Thank you
    very much.

End file

    LINE 1
    LINE 2
    LINE 3

Solution:

    )3:wq!<CR>

