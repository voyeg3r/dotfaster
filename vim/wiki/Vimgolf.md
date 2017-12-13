Search vimgolf chalenges to vim users.

after installing vimgolf, as the site recomends, type:

    gem list

    PATH=$PATH:/home/sergio/.gem/ruby/2.3.0/bin

See also
+ [vimbesttips](vimbesttips.md)
+ gem install vimgolf-finder

Each vimgolf challenge starts with: http://www.vimgolf.com/challenges/
followed by its unique number

**VimGolf Chalenges**

# create arrows in a list
+ http://www.vimgolf.com/challenges/59381bd3652ee10dec000005

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
+ http://www.vimgolf.com/challenges/4d1a34ccfa85f32065000004

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

Seeing the firt solutions that uses "V" as a search pattern I ended up asking
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
+ https://www.youtube.com/watch?v=_cECidIga14&feature=youtu.be

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

Solution:

    <C-V>GI", "<Esc>xr[8gJA" ]<Esc>ZZ

# Interweave two blocks of text
+ http://www.vimgolf.com/challenges/4dcd7b572c8e510001000005
+ vimgolf put 4dcd7b572c8e510001000005

Initial file

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

Final file

	one	1
	two	2
	three	3
	four	4
	five	5
	six	6
	seven	7
	eight	8
	nine	9
	ten	10

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

# One number per line
+ vimgolf put 56fb2e75ccffcc0009026473
+ youtube explanation: https://www.youtube.com/watch?v=GvRSiY_UFSw

Just give me the numbers.

Start file

    - One number per line -
    -----------------------
    2,3,5,7,
    11,13,17,
    19,23,29,

End file

    2
    3
    5
    7
    11
    13
    17
    19
    23
    29

Solutions:

This one takes 14 keystrokes

    5gJV"=[<C-R><C-A>]<CR>pZZ

In this challenge we have learned

1 - how to store a list into a register (one per line)
2 - how to join lines whitout any space between them

# Words in parens - vimgolf put 5192f96ad8df110002000002

We should all ace this, right?

Start file

    one two
    three

End file

    (one) (two)
    (three)

Solution:

    cw(<C-R><C-O>")<Esc>w.w.ZZ

The trick here is to insert the default register literally using
Ctrl-r Ctrl-o

Basically, it causes the '<C-R><C-O>' command itself to go into the '.'
register, instead of the literal text which was in the register when you gave
command the. This means that when you repeat the operation with '.', you'll
get whatever's

# Increment, increment, increment - http://vimgolf.com/challenges/4d1cc35a35b40650b800043a

Start file

    1

End file

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
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25

Best solution

    Y24pVGg<C-A>ZZ

    See :help v_g_CTRL-A


 ``` markdown
        {Visual}g CTRL-A	Add [count] to the number or alphabetic character in
    			the highlighted text. If several lines are
    		        highlighted, each one will be incremented by an
    			additional [count] (so effectively creating a
    			[count] incrementing sequence).  {not in Vi}
    			For Example, if you have this list of numbers:
    				1. ~
    				1. ~
    				1. ~
    				1. ~
    			Move to the second "1." and Visually select three
    			lines, pressing g CTRL-A results in:
    				1. ~
    				2. ~
    				3. ~
    				4. ~
```


# I forgot quotes
+ http://vimgolf.com/challenges/5462e3f41198b80002512673

Start file

    foo = a
          ab
          abc

End file

    foo = "a"
          "ab"
          "abc"

Solution:

    Score 10 - Final. Block select, back one char, append, then repeat at EOL.
    <C-V>GhA"<Esc>$.ZZ

# Swap values - http://vimgolf.com/challenges/56d70389bbbe462aff01d42a

Start file

    name=www-data, groups=developer

End file

    name=developer, groups=www-data

Best Solution:

    E8X}vbp<c-o>PZZ

What I have learned in this challenge?

1 - Using <C-O> to jump back my initial normal point
2 - More about deleting previous characters with `8X`

# Every other line -
+ http://vimgolf.com/challenges/57d7d06d9ce5640f6f000001

Start file

    aaaaaaa
    aaaaaaa
    aaaaaaa
    aaaaaaa
    aaaaaaa

End file

    AaAaAaA
    aaaaaaa
    AaAaAaA
    aaaaaaa
    AaAaAaA

Solutions:

1 -  RAaAaAaA<Esc>ww.ww.ZZ   :  17 keystrokes
2 -  4RAa<Esc>xYjpjpjdGZZ    :  16 keystrokes
3 -  O<Esc>4i~ <Esc>dd3@"ZZ  :  14 keystrokes
4 -  qq<C-V>}~ @qq@qZZ       :  13 keystrokes

In the third solution we create a new line above to stor a default
register with '~ ' 4 times. Then it is used as register in nromal mode

In fourth solution we make use of a recursive macro, and it will always
give us the same result

# Put hyphens everywhere.

    -a-b-c-

Start file

    abcdefghijklm

End file

    -a-b-c-d-e-f-g-h-i-j-k-l-m-

Solutions:

    :s/\n*/-/g<CR>ZZ

# Transposition

Transpose the original lines in separate columns, one for each line.
Start file

    ultricies, vehicula, felis, sed, auctor, aenean, euismod, semper, quam, dapibus
    nibh, consequat, consequat, maecenas, sit, amet, mauris, justo, quis, porttitor
    curabitur, pharetra, euismod, orci, sit, amet, ullamcorper, mi, tincidunt, et
    vitae, lorem, at, mi, feugiat, convallis, ac, eget, dui, fusce
    blandit, iaculis, nulla, sit, amet, dolor, nec, est, ornare, volutpat

End file

    ultricies  nibh       curabitur    vitae      blandit
    vehicula   consequat  pharetra     lorem      iaculis
    felis      consequat  euismod      at         nulla
    sed        maecenas   orci         mi         sit
    auctor     sit        sit          feugiat    amet
    aenean     amet       amet         convallis  dolor
    euismod    mauris     ullamcorper  ac         nec
    semper     justo      mi           eget       est
    quam       quis       tincidunt    dui        ornare
    dapibus    porttitor  et           fusce      volutpat

# Simple, Practical, and Common -
+ vimgolf put 55b18bbea9c2c30d04000001

Start file

	*temp var1 0
	*temp var2 "hi"
	*temp var3 -1
	*temp var4 42
	*temp var5 "asdf"
	*temp var6 0

	Simple things we do all the time should be able to be done with very few keystrokes, but sometimes I find something I need to do makes me go, "There MUST be a better way."

	This challenge is just a simple movement and entering text at a certain place.

End file

	*temp var1 0
	*temp var2 "hi"
	*temp var3 -1
	*temp var4 42
	*temp var5 "asdf"
	*temp var6 0
	*temp var7 11

	Simple things we do all the time should be able to be done with very few keystrokes, but sometimes I find something I need to do makes me go, "There MUST be a better way."

	New text.

	This challenge is just a simple movement and entering text at a certain place.

Solution:

	#Yp<C-A>w11<C-A><Esc>GONew te<TAB>.<ESC>ZZ

# Separate lines
+ vimgolf put 595a5dd1b9304b000c000011
+ https://www.youtube.com/watch?v=S9o5bHUAbP0

Every other line is mixed up. Separate them into their original texts.

Start file

	Lorem ipsum dolor sit amet, consectetur adipiscing elit,
	Whose woods these are I think I know.
	sed do eiusmod tempor incididunt ut labore et dolore magna
	His house is in the village though;
	aliqua. Ut enim ad minim veniam, quis nostrud exercitation
	He will not see me stopping here
	ullamco laboris nisi ut aliquip ex ea commodo consequat.
	To watch his woods fill up with snow.
	Duis aute irure dolor in reprehenderit in voluptate velit
	My little horse must think it queer
	esse cillum dolore eu fugiat nulla pariatur. Excepteur
	To stop without a farmhouse near
	sint occaecat cupidatat non proident, sunt in culpa qui
	Between the woods and frozen lake
	officia deserunt mollit anim id est laborum.
	The darkest evening of the year.

End file

	Lorem ipsum dolor sit amet, consectetur adipiscing elit,
	sed do eiusmod tempor incididunt ut labore et dolore magna
	aliqua. Ut enim ad minim veniam, quis nostrud exercitation
	ullamco laboris nisi ut aliquip ex ea commodo consequat.
	Duis aute irure dolor in reprehenderit in voluptate velit
	esse cillum dolore eu fugiat nulla pariatur. Excepteur
	sint occaecat cupidatat non proident, sunt in culpa qui
	officia deserunt mollit anim id est laborum.
	Whose woods these are I think I know.
	His house is in the village though;
	He will not see me stopping here
	To watch his woods fill up with snow.
	My little horse must think it queer
	To stop without a farmhouse near
	Between the woods and frozen lake
	The darkest evening of the year.

Solution:

	:g/./+m$<CR>ZZ

# ascii-art diamond
+ http://www.vimgolf.com/challenges/57a4ec036f04c40bf8000001
+ https://www.youtube.com/watch?v=7LHJfeYIaPo

Start file

		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------
		----------------------------------------

End file

						   /\
						  // \
						 ///  \
						////   \
					   /////    \
					  //////     \
					 ///////      \
					////////       \
				   /////////        \
				  //////////         \
				 ///////////          \
				////////////           \
			   /////////////            \
			  //////////////             \
			 ///////////////              \
			////////////////               \
		   /////////////////                \
		  //////////////////                 \
		 ///////////////////                  \
		////////////////////                   \
		\                   ////////////////////
		 \                  ///////////////////
		  \                 //////////////////
		   \                /////////////////
			\               ////////////////
			 \              ///////////////
			  \             //////////////
			   \            /////////////
				\           ////////////
				 \          ///////////
				  \         //////////
				   \        /////////
					\       ////////
					 \      ///////
					  \     //////
					   \    /////
						\   ////
						 \  ///
						  \ //
						   \/

Solution

		jdGVr 19lR/\<Esc>Sykphr/g_xpjr/_Xp<Esc>upxp19@.ZZ
		ykphr/g_xpjr/^Xp  Esc u

