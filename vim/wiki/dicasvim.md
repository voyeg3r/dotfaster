``` markdown
Arquivo: dicasvim.md
Created:     Sáb 06/Nov/2010 hs 18:10
Last Change: qua 27 set 2017 14:51:57 -03
```

# Vim tips for everyone

see also [Best of vim tips](vimbesttips.md)
See also: [Regex](Regex.md) page
vim profiler: https://github.com/bchretien/vim-profiler

    git clone https://github.com/vim-jp/vital.vim.git
    A comprehensive Vim utility functions for Vim plugins

# Delete preceding char (use X)

For example: if your cursor is placed in "m" in

    # my comment

and if you want to erase the space:

Just type

    X

# jumping to the first non-blank character

    _ ................ jump to the first non-blank character
    ^ ................ jump to the First non-blank character

# Using vim with no plugins

```vim
    set path+="**"
```

    :find filename<tab>

    gf  at any file on the cursor is over will jump to the file

    :ls ......... list buffers
    :b 2 ........ go to buffer 2
    :b substring  opens any file with substring

[#](#) Nice paragraph formating
+ http://vimcasts.org/episodes/formatting-text-with-par/
+ http://www.nicemice.net/par/

``` markdown
# paragraph formater (useful for vim)
# https://aur.archlinux.org/packages/par/
# sudo pacman -U par-1.52-2-i686.pkg.tar.xz
wget -c https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=par -O PKGBUILD && makepkg -sri PKGBUILD
```

# Deleting every other line (deleta linhas pares)

    :g/^/+d .................. deletes even lines
    :d|g/^/+d ................ deletes odd lines

    :g/^/+d A ................ storing deleted lines in a register

Recursive mapping

    :map <C-o> ddj<C-o>
    <C-o>

# Virtualedit
+ https://stackoverflow.com/a/30323328/2571881

This allows you to put characters virtually everywhere on your text

    :let x=&ve
    :set ve=all|2,5norm! 19|r#
    :let &ve=x

    :set virtualedit=all

``` markdown
+--------------------------------------------------------------------------------+
|  The above setting allows you to put your mouse even where does not exist text |
|  and create a vertical selection to put something linke this box               |
+--------------------------------------------------------------------------------+
```
The problem happens more when you have many lines in different sizes

# Inserting a-z using macro - incrementando letas com ctrl-a

Using set `nrformats+=alpha:`

    ia<Esc>qqylp<C-a>q24@q

Step by step:

    ia<Esc>      " Start with 'a'
    qqylp<C-a>q  " @q will duplicate the last character and increment it
    24@q         " Append c..z

    :r !printf '\%s' {a..z}

# Show filetype

    :se ft?
    :echo &ft

# Inserting primary selection content

For those who do not know what "primary selection is", putting it simple.

	"The text selected and is just captured automatically to its
	special clipboard space (Linux only)"

On vim just press: `Shift-insert` "primary selection"

While in insert mode, you can use `Ctrl-R` {register}, where register can be:

    + for the clipboard,
    * for the X clipboard (last selected text in X),
    " for the unnamed register (last delete or yank in Vim),
    or a number of others (see :h registers).

	Ctrl-R {register} inserts the text as if it were typed.
	Ctrl-R Ctrl-O {register} inserts the text with the original indentation.
	Ctrl-R Ctrl-P {register} inserts the text and auto-indents it.
	Ctrl-O can be used to run any normal mode command before returning to insert mode, so
	Ctrl-O "+p can also be used, for example.

For more information, view the documentation with `:h i_ctrl-r`
# gn command

    cgn ............. change next searched pattern
    n ............... go to next occurrence
    . ............... repeat last change

# Moving around

    g; ....... goes to older position on changelist
    g, ....... goes to newer positoin on changelist

# Exit ex mode

    q:  ............... eters ex mode
    ^c ................ exit it

# Auditing vim mappings

	:verbose map <c-a>
	:verbose imap x

# spliting funtions into separated files

The selections starts with

    na macro a eu busco linhas não vazias pois
	eu tinha funções de uma liha

	macro a --> /^[^ ]Vynpvt("by:sav! b:bd!j

	Já na macro b eu tinha que casar funções completas

        busca mais complexa --> /^[^ ][^{]*.*\_[^ ][^}]*

	Descobri um jeito mais fácio no vim pra gravar a macro
	que pega os blocos de código

	/()\s\+{

	isso corresponde ao começo da função, daí é só
	dar um vip em modo normal

# Remove offending key from known_hosts file with one swift move

     vi +18d +wq ~/.ssh/known_hosts

alternatively you can use sed:

     sed -i 18d .ssh/known_hosts

# Erase / delete change history
+ https://superuser.com/a/263406/45032

    :set undoreload=0 | edit

# Edit subtitles with vim
+ https://github.com/tpope/vim-speeddating
+ https://stackoverflow.com/a/24149171/2571881

After instaling Tim Pope's speeddating plugin you can do something like:

    :g/\v^\d{2}:\d{2}:/execute "normal t,10\<C-x>2t,10\<C-x>"

# Swap two words fast
+ Plug tommcdo/vim-exchange

or

    one word

    dw .......... delete word
    wP .......... jump to the next word and paste

    after that jump the next word and do:
    ^ra

    ^r ................ Ctrl-r
    a ................. paste register 'a'

# Swap two columns separated by space
+ https://stackoverflow.com/a/24424034/2571881

I have two columns:

    dog cats
    dog cats

I want to swap the two columns:

    cats dog
    cats dog

Solutions:

    :%!awk '{print $2, $1}'

    :'<,'>normal "adt xA cats

    :.normal "adt xA <Ctrl-v><Ctrl-r>a

    :%s,\v(\w+) (\w+),\2 \1,g

# How many open buffers do I have?
+ http://superuser.com/a/345593/45032
+ http://stackoverflow.com/a/42024307/2571881

    echo len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

# How do I search the open buffers in Vim?
+ https://stackoverflow.com/a/11976158/2571881

    :bufdo vimgrepadd pattern % | copen+

# Inserting a range of numbers

    :0put =range(1,10)

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

Joining (puting) even and odd lines at the same line

    :%norm J
    :g/^/J

    1 2
    3 4
    5 6
    7 8
    9 10

Merge vertical lists in Vim (doiing the oposite of above)

This is simple, just place the cursor on the column between the lists. Insert
visualblock-mode <C-v>, mark the whole column, hit r to replace it, and then
<CR> and you have what you want. source: https://stackoverflow.com/a/46034410/2571881

# Substitution on visual selection

Before block with old and s First told abc old sold g Another is old, goldold.
but not c Last is older, fold not b After block with fold and older and b old.

    %s/\%Vold/NEW/g

Before block with NEW and s First tNEW abc NEW sNEW g Another is NEW, gNEWNEW.
but not c Last is NEWer, fNEW not b After block with fNEW and NEWer and b NEW.

Doing a visual block selection you can do:

    :'<,'>s/\%V /\r/g

The `\%V` will make sure the substitution happens only in the selection area

Here are two further examples that do not use a visual selection. The first
command searches only in lines 10 to 20 inclusive. The second searches only
between marks a and b.

    /\%>9l\%<21lgreen
    /\%>'a\%<'bgreen

# Open file read-only
edit `/etc/nginx/nginx.conf` in read-only mode:

    sudo vim +M /etc/nginx/nginx.conf

# Scrolling down both parts of a split-window at the same time in Vim
source http://stackoverflow.com/a/2986980/2571881
First you can open two files, each in its window, doing this:

    vim -o file1.txt file2.txt

In the first file:

    :set scrollbind

In the second file:

    :set scrollbind

# Browsing vim help

To open a link just press `Ctrl-]` and to jump back `Ctrl-t` or `Ctrl-o`

# open the file on the line where the 3rd occurrence of the pattern appears
+ [tecmint.com](http://www.tecmint.com/how-to-use-vi-and-vim-editor-in-linux/)

    vim filename +$(grep -in pattern filename | sed -n 3p | cut -d: -f1)

Let’s take a closer look at what the above command does:

    grep -in pattern filename – displays all lines from filename where pattern
    occurs, with the line number at the beginning of each output line. sed -n
    3p – displays the 3rd line from the preceding pipeline’s output.

Finally,

    cut -d: -f1 returns the first field of the previous pipeline with the colon
    (:) is the field separator.

# Delete till end of current parenthesis block in vim

Say I am editing this json

``` json
{
  "a": {"language": "python"},
  "b": {},
  "c": {"language": "java"},
  "d": {"encoding": "utf-16"}
}
```

My cursor is at b of `"b": {}`. I want to delete till the end of current `{}`
block. So it'll look like,

``` json
{
  "a": {"language": "python"},
  "
}
```
solution

``` vim
d]}
```
to see more:

``` vim
:h ]}
```

# Open blank new file with the same name as existing file in one step, in VIM?

    vim -c '%d' file.txt

# Vimscript: adding text to the current line
+ https://vi.stackexchange.com/a/12450/7339

     call setline('.', getline('.') . 'new text')

# Making vim show spaces tabs and other things
[Source stackoverflow](http://stackoverflow.com/a/38652646/2571881)

``` vim
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set lcs+=space:·
```

# Editing complex commands and search

When you have complex commands and searches you can open for each of theses
modes a special window

    Ctrl-f in command mode opens 'command line window'
    q: also open command line window
    q/ open search command window

    /ctrl-p inserts my last search

# Inserting filename

The following commands insert lines consisting of the full path of the current
and alternate files into the buffer:

``` vim
:put =expand('%:p')
:put =expand('#:p')
```
**using ultisnips**
``` vim
snippet filename "insert filename" w
`!p snip.rv = snip.fn`
endsnippet
```

I also have this line on my `~/.vimrc`, it allows me to insert the filename easily

``` vim
iab fname <c-r>=expand("%:p")<cr>
```

# Inserting blank lines below and above
+ https://superuser.com/a/607193/45032

``` vimscript
nnoremap <Enter> :call append(line('.'), '')<CR>
nnoremap <S-Enter> :call append(line('.')-1, '')<CR>
```

another similar solution

``` viml
" https://vi.stackexchange.com/a/7278/7339
nnoremap <leader>o @="m`o\eg``"<cr>
nnoremap <leader>O @="m`O\eg``"<cr>
```

# Tips on searching
[Read more here](https://www.linux.com/learn/vim-tips-basics-search-and-replace)

``` markdown
/finding/e ...... puts the cursor at the end
/finding/b ...... puts the cursor at the beginning 'also s'

/string/e-3 will place the cursor on the third character from the last character of the matched string.
```

# Função para converter wiki para markdown
[Source: stackoverflow](http://stackoverflow.com/a/3024430/2571881)

``` vim
" :bufdo execute "normal @a" | write
fun! FuncWikiToMd()
    %s/\v^\={1,3}([^\=]+)\={1,3}/### \1/ge
    %s/\[\[code format.*/``` sh/ge
    %s/\[\[code\]\]/```/ge
endfun
command! -nargs=0 W2MD :call FuncWikiToMd()
```

# Getting rid of '-' on html links
[Source: stackoverflow](http://stackoverflow.com/questions/41529264/)

Executar uma substituição apenas na área selecionada

The `\%V \%V` will make the search pattern work over
only in selected area.

    <a href="https://example.com/hello-world-hi">hello world hi</a>

    :s/\%V-\%V/ /g

    :s/\%V\s\%V/-/g

    "ANOTHER EXAMPLE WITH \%V

    Transform this:
    printf(text goes here);

    into this:
    printf("text goes her");

    s/\%V\(.*\)\%V./"\1"/g

OBS: the `\%V` option only selects up to the cursor, leavin
one char out of the substituition, that's way we are using
a dot '.' in the searh, to add a extra char.

# Tips about ultisnips
source: http://vimcasts.org/episodes/ultisnips-visual-placeholder/

If you wnat to overwrite a snippet definition just put
at the beginning of your file

    priority 1

# Editing your snippets quickly

    :UltiSnipsEdit

    In my case I have a vim map:

    nnoremap <leader>u :call UltiSnipsEdit<cr>

    As interpolações tem que estar dentro de crases
    ou backtickets in English

# Insere a data usando interpolação do vim

    !v strftime('%Y-%m-%d')
    !p  interpolação python

    !p snip.rv = "return value"
    t[1] --> tabstop 1

Ou abreviações do próprio vim

    iab idate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

# Usando snippets espelho ou não

``` markdown
snippet req "require a module" b
let ${1:${VISUAL}} = require('${2:$1}');
${0}
endsnippet
```

O snippet acima repete na posição 2 o valor da posição 1
e permite que o segundo possa ser alterado

** Replace spaces or non-ascii with underscores **: As it uses visual mode
you can select the text, press tab and type 'us' `<tab>`

``` vim
snippet us "replace specials with underscores" w
`!p
import re
snip.rv = re.sub("[^0-9a-zA-Z]", "_", snip.v.text)
`
endsnippet
```

# Remove parenthesis of current line

    :s,(\|),,g

# Quickfix list manipulations and :cdo command

``` vim
copen
ccl
```

``` vim
:vimgrep main {1,2,3}.cpp
:cwindow
:cdo s/foo/bar/g
```

Um exemplo de fluxo de trabalho com o comando `:cdo`
Primeiro usar o grep para popular o quickfixlist

        grep arquivo

Abrir o quickfixlist pra ver se a busca casou

        :copen

Pra fechar o quickfixlist apenas :ccl

        :ccl

No meu caso adicionei uma linha no começo de todos os arquivos

        :cdo normal ggOthis is only a test^[

Depois eu apaguei a linha adicionada

        :cdo normal ggdd

Gravei todos os arquivos depois do teste

        :cdo write

Fechei  todos os arquivos

        :qall

# Links or worth clicking

    http://www.mileszs.com/vimlinks.html

# [Vimgolf](Vimgolf)

# Start vim with no plugins
source: Book practical vim
https://pragprog.com/book/dnvim2/practical-vim-second-edition

    vim -u NONE -N
    vim -u NONE -N fileyouwantopen

The -u NONE flag tells Vim not to source your vimrc on startup. That way, your
customizations won’t be applied and plugins will be disabled. When Vim starts
up without loading a vimrc file, it reverts to vi compatible mode, which causes
many useful features to be disabled. The -N flag prevents this by setting the
‘nocompatible’ option.

# Magic with expression register

``` markdown
6 chairs, each costing $35, totals $

A ............... start insert mode at the end of line
Ctrl-r = ........ starts expression register (cursor at the bottom)
6 * 35 <enter> .. inserts the result
```

# Viewing where maps are setted

    :verbose map

    :redir! > vim_keys.txt
    :silent verbose map
    :redir END

# Reopen previous buffer in a new window

    Ctrl-w Ctrl-6

If you want to jump to buffer 7 just type:

    7 Ctrl-6

You can also type part of the buffer name or even use a mapping like this:

    nnoremap <Leader>b :ls<CR>:b<Space>

# Copy from one buffer to another
[stackoverflow](http://stackoverflow.com/q/41259890/)

I try to copy the lines 7,11 from buffer 2 to my buffer 3 without leaving
buffer 3. Is it possible to do that with a simple command?

Usually I go to B2, yank the lines come back to B3 and paste them. I will be
interest to do that using range but I do not succeed.

There is the getbufline() function that allows you to obtain lines from another
buffer. You can :put that into the current buffer via the expression register:

     :put =getbufline(2, 7, 11)

# Setting and getting position on vim

References: http://vi.stackexchange.com/questions/6208/
http://stackoverflow.com/questions/3922384/

``` vim
:call setpos('.',[0,6,10,0])

:let pos = getpos("'a")

:call setpos("'a", pos)

if  getpos("'a")[1] == 0
    mark a
else
    process calculate
endif

:exec "'a"

:ec getpos("'a")[1]  --> returns line number of mark 'a'

:put =getbufline(1,1)

o comand acima pega o buffer 1 linha 1 e cola na linha atual

ec expand(getline('.'))
o comando acima ecoa na tela a string da linha atual

let var = expand(getline('.'))

to search for lines equal to current line do this:

exec '/' . getline('.')

/<C-r>=getline('.')<CR>

Using a "register" on search

:exe '%s/' . @a . '/foo/g'
```

# How to know if vim has python support

    vim --version | grep python

# Insert a command range easily
Reference: http://stackoverflow.com/questions/35693335/

    4:   equals to :.,.+3

for example if you want to save only the next three lines
you cand do this:

    3:   then vim will show this:
    :.,.+2  what means the current line "." plus the next two lines

and finally you type wq!

the entire line will be:

    :.,.+2wq!

# Adjusting columns of text on vim

``` markdown
Stallman  Richard GNU 1953  USA
Wall  Larry   Perl  1954  USA
Moolenar  Bram  Vim 1961  Netherlands
Tridgell  Andrew  Samba  1967  Australia
Matsumoto  Yukihiro  Ruby  1965  Japan
Ritchie  Dennis  C  1941  USA
Thompson  Ken  Unix  1943  USA

Stallman   Richard   GNU    1953  USA
Wall       Larry     Perl   1954  USA
Moolenar   Bram      Vim    1961  Netherlands
Tridgell   Andrew    Samba  1967  Australia
Matsumoto  Yukihiro  Ruby   1965  Japan
Ritchie    Dennis    C      1941  USA
Thompson   Ken       Unix   1943  USA
```

The command typed to perform the above change was:

    :'<,'>!column -t

to sort by surname just do this:

    :%!sort -k1

Sorting by last name

    first name,last name,email
    john,smith,john@example.com
    drew,neil,drew@vimcasts.org
    jane,doe,jane@example.com

    :2,$!sort -t',' -k2

    -t represents field separator
    -k2 relates to the second field

# Sum second column using awk
Let's say you have this file:

    index  1
    other  2
    one    3
    two    6

In order to sum column two you can use this command

    :r!awk 'NR<=4 {sum+=$2} END {print "total: "sum}' %

Another similar example:

OBS: as we have spaces and awk considers it as field separator,
we do not have to worry about changing field separator.

    delta: 0.146577 -- loop: before imiu
    delta: 0.146109 -- loop: before imiu
    delta: 0.146568 -- loop: before imiu
    delta: 0.146971 -- loop: before imiu
    delta: 0.147879 -- loop: before imiu
    delta: 0.147153 -- loop: before imiu
    delta: 0.146387 -- loop: before imiu

    :r!awk 'NR<=7 {sum+=$2} END {print "total: "sum}' %

    total: 1.02764

Another solution is: Make a visual selection and copy
the numbers to a register, let's say 'a', and then
perform a substituition on that register, replacing the newline
'c-V c-J' with a plus signal, and finally using

    let @a=substitute(@a, 'c-V c-J', '+', 'g')

    ic-R=c-Ra Enter

    Total = 69.5

Function to sum visual selection

    " This function requires you select the numbers
    " source: https://vi.stackexchange.com/a/4699/7339
    fun! SumVis()
        try
            let l:a_save = @a
            norm! gv"ay
            let @a = substitute(@a,'[^0-9. ]','+','g')
            exec "norm! '>o"
            exec "norm! iTotal \<c-r>=\<c-r>a\<cr>"
         finally
            let @a = l:a_save
         endtry
    endfun
    vnoremap <c-s> :<C-u>call SumVis()<cr>

Another solution:

    command! -range=% -nargs=* SumColumn <line1>,<line2>!bash -c 'awk -F ${2:-|} "{print; sum+=\$(${1:-NF - 2} + 1)} END {print \"Total: \"sum}"' sumcolumn <args>

# Vimscript: programatically get visual selection point

    :ec getpos("'<")

    The result is a |List| with four numbers:
    [bufnum, lnum, col, off]

    Using this way
    let l:vistart = getpos("'<")[1:2]

    It will set l:vistart to line number + column

    :call setpos("'<", [0, 5, 19, 0])
    The line above sets visual marks start on line 5 column 19

    " Locate visual block boundaries...
    let [buf_left,  line_left,  col_left,  offset_left ] = getpos("'<")
    let [buf_right, line_right, col_right, offset_right] = getpos("'>")

    locate cursor position
    getpos('.')[1:2]  --> line and column

    locate visual start precisely
    virtcol("'<")


# Manipulation visual block

``` viml
function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
```

# Generating random numbers in vim
+ https://stackoverflow.com/a/20430735/2571881

     :r! echo $RANDOM

     function! Random()
         return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
     endfunction

then

     9@:

Vim doesn't offer native random generator, however if you have vim compiled
with Python, the following method will append a random digit at the end of
your line:

     py import vim, random; vim.current.line += str(random.randint(1, 100))

If you don't have access to shell and Python, as for workaround, you use last
few digits from the current timestamp, in example:

     :put =reltimestr(reltime())[-2:]

# Vim duplicate line multiple times with 2 keypresses
+ http://stackoverflow.com/a/43755604/2571881

This solution uses the expression register <c-r>= or @=

    nnoremap , @='mqYp`q'<cr>

# Yank text object on multiple lines

 Let's say you have:

 ``` markdown
 - 'autoindent' is set by default
 - 'autoread' is set by default
 - 'backspace' defaults to "indent,eol,start"
 - 'backupdir' defaults to .,~/.local/share/nvim/backup (|xdg|)
 - 'complete' doesn't include "i"
 - 'directory' defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created
 ```

And you want to get the names at the beginning like 'autoindent' and grab them
into a register 'z'

you cand do

``` vim
    :%norm f'"Zya'

and to paste it into a file you can do:

    :put Z

To make it available outside of Vim you can do:

    :let @+ = @z

if your register z is not clean you can clear it by doing

    qzq
```

# I would like to copy the first words of multiple lines.
+ http://stackoverflow.com/a/43003031/2571881

Example of code :

``` viml
apiKey := fmt.Sprintf("&apiKey=%s", args.ApiKey)
maxCount := fmt.Sprintf("&maxCount=%d", args.MaxCount)
id := fmt.Sprintf("&id=%s", args.Id)
userid := fmt.Sprintf("&userid=%s", args.Userid)
requestFields := fmt.Sprintf("&requestFields=%s", args.RequestFields)
```

I would like to have this in my clipboard :

    apiKey
    maxCount
    id
    userid
    requestFields

Solutions

    :%norm 0"Zyt:     ................ this one for intire file
    :'<,'>norm! "Qye  ................ this one for selection are only

Obs: You need to have > in cpoptions for the newline to be added in between
yanks (:set cpoptions+=>), otherwise the words will be concatenated on a single
line.

    >	When appending to a register, put a line break before
        the appended text.

To see all cpoptions:

    :verbose set cpoptions?

# Inserting ttyrecordings at stackexchange

[![asciicast](https://asciinema.org/a/14.png)](https://asciinema.org/a/14) https://asciinema.org/docs/embedding

# Avoiding error messages on vim substituitions

``` vim
:%s/\s\+$//e
:silent! %s/\s\+$//
```

# Clipboard manipulation
[souce stackoverflow](http://stackoverflow.com/a/11489440/2571881)

Faster way to paste data into vim than with paste mode? When I try to paste
hundreds of lines or more into Vim, even in paste mode, it takes much longer
(10 times or more?)

If your Vim is compiled with clipboard support

``` vim
:echo has('clipboard') returns 1

```
you can simply use "+p or "*p

On X11 systems both registers can be used. See `:help x11-selection` for more
details, but basically the `"*` is analogous to X11's PRIMARY selection (which
usually copies things you select with the mouse and pastes with the middle
mouse button) and `"+` is analogous to X11's CLIPBOARD selection (which is the
clipboard proper).

In order to preserve indentation during paste you could use <c-r><c-p>* or
<cr>c-p>+ see more at `:help i_CTRL-R_CTRL-P`

# Como criar um diário no vim usando o vimwiki

source: http://stackoverflow.com/q/40414720/

    vim +VimwikiMakeDiaryNote

# Select yanked and pasted text

     gv ............ reselects last visual selection
     `< ............ goes to first character of last selection
     '< ............ first line of last selection
     '> ............ last line of last selection

If you want to change the boundaries of the previous selection just type:

    m< .............. sets selection start
    m> .............. sets selection end

 in order to select previous pasted text put this in your .vimrc

     " select last paste in visual mode
     nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

# vim shift selection in column mode (not text)
+ https://stackoverflow.com/a/41170193/2571881

 to select the same ammount of lines for example use `1v`

     :5mark < | 10mark > | normal gvV
     :5mark < | 10mark > | normal gv

# Non-greedy search on vim

    /abc\_.\{-}def

Finds abc followed by any characters or newlines (as few as possible) then def.
Finds abcdef or abc followed by any characters then def.

# Changing modes on ctrl-p

   just press Ctrl-f or Ctrl-b

# Fixing subtitles with vim

My problem: subtitles whithout space like this;

``` markdown
133
00:06:36,398 --> 00:06:37,398
Com licença.
134
00:06:37,910 --> 00:06:39,538
Me explique o
sistema organizacional
```

The solution

``` vim
\v([^0-9]$\n)([0-9]+)
:%s//\1\r\2/g
```

References: http://vim.wikia.com/wiki/Search_across_multiple_lines

# Appending registers with global command

    :g/TODO/yank A

if you have a function like:

``` vim
if (isFoo)
    bar();
```

and want something like:

    if (isfoo) { bar(); }

    you can do:

    :g/if/normal A {^v^cJA}

this is a normal mode move being applied to lines matching an specific pattern.
We are opening a curly brackets in the end of the line (A {), getting back to
normal mode (ctrl+v ctrl+c or ctrl+v esc), bringing up the line below it (J)
and adding the closing curly brackets (A })

If you are wondering, the ctrl+v allows us to type a non-digit literally in
command line (in our case the ESC or Ctrl+C).

References: http://vim.wikia.com/wiki/Search_across_multiple_lines

In some situations, for example: If you want to change
a word, putting parenthesis around it, you have to use a literal
default registr --> "

        three
        one two

        (one) (two)
        (three)

temos que usar

        <c-r><c-o>"

# Command line tricks

    :9 copy 13

copia a linha 9 para a linha 13

    :9t16

does the same faster

    :[range]copy {address}

    :9t.

Usando relative numbers

    :-7t.

 ``` markdown
 +------------+-----------------------------------------------------------------------------------------------+
 |  command   |  action                                                                                       |
 +------------+-----------------------------------------------------------------------------------------------+
 |  :9t. 	  |  copy line 9 below the current line                                                           |
 |  :t5 	  |  copy the current line placing a duplicate below the line 5 (and moving the cursor)           |
 |  :-7t. 	  |  copy the line 7 before the current cursor position placing a duplicate below the current line|
 |  :+4t. 	  |  copy the line 4 after the current cursor position placing a duplicate below the current line |
 |  :9,11t.   |  copy the lines 9 to 11 placing the duplicate lines below the current cursor position         |
 |  :-5t.     |  copy the line 5 rows above to the current line                                               |
 |  :1m.      |  move line one to the current line                                                            |
 |  :-3m.     |  move the line up 3 to this position                                                          |
 +------------+-----------------------------------------------------------------------------------------------+
 ```

The offsets can also be used with the other items in a range.  Look at this
one: >

	:.+3,$-5

This specifies the range that starts three lines below the cursor and ends
five lines before the last line in the file.

# Formating text on vim

    gwip .... formats paragraph and restores cursor position

# How repeat last command in vim - repetir ultimo comando

    @:

Which means "@" register, : command

    @@  --> repeat last register easily

Following the same logic you can repeat last search by pressing @/ or just //

    Repeating the last substituition using &
    Repeat last substituition over whole file g&

# Using submatch in vim search

Supose you have these lines:

``` html
<h2>Heading number 1</h2>
<h3>Number 2 heading</h3>
<h4>Another heading</h4>
```

" highlight only digits inside html tags

        \v<\/?h\zs\d\ze

        h\zs\d\ze   →   this version works and is easy to type

" promote each digit matched in the above search

        :%s//\=submatch(0)-1/g

		:s/\d\+/\=submatch(0) + 1/
        increases digits

# Converting numbers to chars
The range of printable chars spams from 32 to 93

    :put =range(32,93)
    :%s,.*,\=nrm2char(submatch(0))
    :%j

### More submatch operations
+ https://stackoverflow.com/a/46295517/2571881

This transforms

``` markdown
0010|C|||N55555555|E0222222220010
0010|C|||N55514200|E0222222220300
0010|C|||N55514200|E0222222220301
0010|C|||N55514200|E0222222229301
```

into

``` markdown
0010|C|||N55555555|E022222222|1.0
0010|C|||N55514200|E022222222|30.0
0010|C|||N55514200|E022222222|30.1
0010|C|||N55514200|E022222222|930.1
```

You can use a sub-replace-expression (see :help sub-replace-\=):

    :%s#\d\{4}$#\=printf('|%.1f', str2nr(submatch(0)) / 10.0)#

That is:

    :%s#: execute this substitute for every line in the file (using # as the delimiter here as I need to use / in the \= part)
    \d\{4}$: match the last four digits of the line

    \=: interprete the following:
        printf('|%.1f: print a | followed by a 1-precision float (the second argument)
        str2nr(submatch(0)): transform the match 4-digit group into a decimal number
        (removes the trailing 0 to avoid reading 0XYZ as octal values)
        / 10.0: divide the value by 10

# Jumping to edit positions and insert position

``` markdown
gi ................. start insert mode at the latest insert position
g; ................. go to the position of the older edit positon
g, ................. go to the previous change position

Ctrl-o ............. jumplist go previous
Ctrl-i ............. go forward in the jumplist
```

# Registros

Registro de expressões

``` markdown
21 * 12  =
12 * 12  =
156 / 12 =
35 * 19  =
```
nnoremap <leader>q 0yt= A<C-r>=<C-r>"<CR><Esc>

Para o trecho acima usamos

       yt=  .......... copia até o igual mas não incluido
       A ............. entra em modo insert no final da linha
       <c-r> ......... inicia o registro de expressões
       <c-r>"......... cola o texto copiado dentro do registro

``` vim
    :put =sqrt(81)   "inserts result in a new line

    :h function-list

    :put =system('ruby fake-creds.rb')
    :read! ruby fake-credentials.rb
    :h :r!
```

# Writing vim functions

    :put =system('echo $RANDOM')
    9@:  ....................... 9 times last command

    :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

    :put +

The line above says: put in the line below the content of + register

    :s/\<./\u&/g

The line above says: make uppercase `\u&` the last searched pattern
which is `\<.` (start of any word)

The above map can change sections like this:

``` markdown
Topic One
=========
This is some text about topic one.
It has multiple paragraphs.
Topic Two
=========
```

``` vim
:onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
```

Try it by putting your cursor in a section’s text and typing cah .
This time Vim will delete not only the heading’s text but also the
line of equal signs that denotes a heading. You can think of this
movement as “around this section’s heading”.

# Runing a macro over last pasted text
+ https://stackoverflow.com/a/46380937/2571881
+ https://www.linuxquestions.org/questions/programming-9/vim-how-pass-argument-to-key-mapping-933036/

In the link above you see the title: vim how pass argument to key mapping

The guy intended to paste some text and perform a macro over it. So we need
to make:

1 - Selection number of lines;
2 - Provide an argument with the macro name
3 - Combine the number with the macro name

    fun! MacroOverSelection(macroname)
        let l:how_many = line("']") - line("'[") + 1
        execute "normal! ". l:how_many . "@" . a:macroname
    endfun

    :call MacroOverSelection("a")

    :com -nargs=1 Mover :call MacroOverSelection(<f-args>)

    :Mover a

A better function that runs over exactly last change/yank block

    fun! RunMacroOver(macroname)
        execute "'[,']normal @". a:macroname
    endfun

    :com -nargs=1 Rover :call RunMacroOver(<f-args>)
    :nnoremap <leader>r :Rover<space>

# Neovim

O problema de instalar o neovim no arch são as dependências
mas é fácil de resolver, basta rodar esta função:

``` sh
installneovim (){
    yaourt -S libtermkey-bzr
    yaourt -S libvterm-git-neovim
    yaourt -S unibilium
    yaourt -S neovim-git
    yankrt -S lua51-messagepack
    } && installneovim
```

# Dica sobre como debugar vim script

    :echom 'Cria uma saida permanente de echo'

  visivel com o comando

    :messages

# Gerando os helptag para navegar na ajuda

http://stackoverflow.com/questions/4180590/

    cd <plugindir>
    vim -c "helptags doc/"

se usa o plugin pathogen coloque no .vimrc

``` vim
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
```

# Configuração do airline
Uma barra de status mais bacana para o vim
https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

# Corretor ortográfico no vim

Corretor ortográfico para VIM
Standard

Você usa VIM para criação de textos (LaTeX ou afins)? Sempre sentiu falta de um
corretor ortográfico? Seus problemas se acabaram!!!

success_vim-273x300
Preparando ambiente:

    Cd ~ ; mkdir corretor ; cd corretor

Baixando a base de palavras:

    Wget http://extensions.libreoffice.org/extension-center/vero-verificador-ortografico-e-hifenizador-em-portugues-do-brasil/pscreleasefolder.2012-01-04.1563120832/2.1.2/vero_pt_br_v212aoc.oxt

# Unzip -x vero_pt_br_v212aoc.oxt
Aplicando no vim

Acesse o vim com o comando abaixo:

    Vim

No vim digite:

    :mkspell pt pt_BR

Obs: Pode demorar um pouco e dará alguns erros de arquivos duplicados, ok?

# Cp pt.utf-8.spl /usr/share/vim/vim*/spell/
Usando o corretor no vim

Dentro do vim execute o seguinte comando:

set spell spelllang=pt,en

Caso queira que o corretor seja habilitado automaticamente sempre que acessar o vim:

     echo 'set spell spelllang=pt,en' >> ~/.vimrc

# Conertendo o formato de arquivo de Windows para Linux

   :set ff=unix

   Para inserir  use o atalho Ctrl-v Ctrl-m no modo [[insert]]

# Colocando o nome do arquivo no proprio

      :put =expand('%:p')

Para somente exibir o full name do arquivo corrente faça:

     1 Ctrl-g   (em modo normal)

# Como limpar os cartões exportados do anki

``` vim
""Primeiro remover as tags html
:%s,<[^>]*>,,g
```

 Tive que exportar meu deck do anki para fazer um backup
 e queria apenas os textos dos cartões (decks), daí me deparei
 com um problema como apagar as tags associadas ao som?

 A solução começa testando este padrão de busca

		\[sound:[^]]*]

		Localizar:

		\[  ............. um colchete de abertura literal
		sound: .......... a palavra sound seguida de dois pontos
		[^]]*] .......... uma lista negada que pega tudo dentro dos colchetes em qualquer quantidade

# Como apagar tags do tipo </font*> no vim

Toda vez que for fazer uma ação de substituição complexa no
vim recomendamos primeiro fazer uma busca incremental pela ocorrência
a ser substituida ou apagada.

Primeiro testamos a busca com o comando abaixo
lembrando que a opção 'hlsearch' ou seleção incremental
da busca estando ativada nos ajuda consideravelmente
no nosso teste de busca

    <\/\?font[^>]*>

A expressão regular acima apaga a tag <font*> ou </font*>
de documentos quaisquer, o asterisco representa qualquer caractere
no intervalo entre 'font' e o fechamento da tag

Explicando:

    < .................. abertura 'literal' da tag
    \ .................. escape para a barra
    / .................. no caso de tag de fechamento tip </font*>
    \? ................. quantificador (no caso zero ou mais)
    font ............... palavra font literal

 EXPLICAÇÃO PARA O GRUPO  ---->  [^<]*

    [ .................. abertura de um grupo
    ^ .................. se aparece no começo do grupo nega tudo que nele aparece
    > .................. no caso estamos negando a fechamento de tag
    ] .................. fechamento do grupo
    * .................. quantificador para o grupo (zero ou mais)

		%s,</\?font[^>]*>,,g

Para evitar usar muitos escapes usamos no comando final (acima) um
delimitador de busca diferente, para não ter que escapar todas asa
barras, havendo somente um escape para \? que é o quantificador da
barra nornal, significa uma barra normal no começo ou não (zero ou 1 ocorrências)

Para quem não sabe no vim você pode fazer substituições do tipo:

    :%s,Windows,GNU/Linux,g

No caso acima o uso da virgula no lugar da barra é providencial
uma vez que a barra no nome GNU/Linux se confundiria com a barra
que delimita a busca ficando assim:

    :%subsitua,isto,poristo,g

# Opening two files side by side

      vim -O file1.txt file2.txt

# Setting utf-8 encoding

``` vim
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
```

# Reindenting whole file

	gg=G

    command! -nargs=0 Reindent :call Preserve('exec "normal! gg=G"')

    "OBS: you need Preserve() function

# Move some line to current line

		:3m .

# Numbering operators

as you know 'u' refers to undo, then you can do this  3u or 3.

# How install new version of vim from source

``` sh
installvim () {
# Https://speakerdeck.com/mbrochh/vim-as-a-python-ide
#   On Ubuntu:
	sudo apt-get install gtk2-engines-pixbuf

	hg clone https://vim.googlecode.com/hg/ vim
	cd vim/src
	./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
	make && make install
	mkdir -p $HOME/bin
	cd $HOME/bin
	ln -s $HOME/opt/vim/bin/vim
	which vim
	vim --version
} && installvim
```

# How extract urls

``` vim
%s/.*\(http.*.mp3\).*/\1/g
g!/\.mp3/d
```

# How to append to clipboard?

    let @+ .= my_expression

# Repeating last subtituition

    &  ........... in normal mode

repetir ultima substituição  &

# Simplest way to show current colorschem

``` vim
:colo

this is the same

:ec g:colors_name
```

# Showing number of lines

besides tradicional  g Ctrl-g that shows in statusbar some
information u can do this

    :echo line('$')

or even map some keystroke to this result

# How insert digraphs in vim
first we explain what are digraphs - are simbols,
to see a complete list of them type  :dig<enter>

In orde to insert digraphs you have:

1 - :set paste
2 - in insert mode type the correpondent code of digraph

In order to insert Unicode symbols:

    Ctrl-Shift U + code

    U+260e →  ☎    U+2702 →  ✂
    U+261e →  ☞    U+2709 →  ✉
    U+27BD →  ➽
    U+2600 →  ☀
    U+2620 →  ☠

# How insert one arrow - type  →

to view the code of carachter below of cursor type 'ga'

To paste text from the system clipbo ard use Shift + Ins in Insert mode or
"*p in Normal mode.  Conversely, "+y yanks the current selection to the system
clipbo ard.

# Numbering lines in sequence

	partridge in a pear tree
	turtle doves
	French hens
	calling birds
	golden rings

Make above lines become this way

	1) partridge in a pear tree
	2) turtle doves
	3) French hens
	4) calling birds
	5) golden rings

	:let i=1
	qa
	I<C-r>=i<CR>)
	<Esc>
	:let i += 1
	q

# Editing a macro on vim

	:put a

	the above command will place register a on my current buffer

	"ap ...... pastes the register after the cursor

# Executing a macro over all files

``` vim
vim *.txt
:bufdo execute "normal @a" | write
```

# Changing a vim macro

Let's say you have a macro 'a' to insert it into your texto just do:

``` vim
:put a
```
or in insert mode:

``` vim
ctrl-r a
```

# Dealig with previous yank register
http://stackoverflow.com/q/12547369/

EDIT 1: repeating using a macro

I was surprised that this operation isn't repeatable using ., but this is
presumably due to the use of visual mode. To repeat the operation using
a macro, do this:

    qqV"0pq

The macro can then be repeated by pressing @q or @@.

EDIT 2: repeating using .

Here's an attempt at making it repeatable using . by not using visual mode.
After yanking the stamp line and moving the cursor, do this:

    "_S<c-r>0<delete>

which uses the insert mode <c-r> command to insert the contents of register 0.
Note that the <delete> is necessary because the stamp line contained a carriage
return. If it did not (i.e. yanking using y$ rather than yy) the <delete> could
be omitted.

# Correct all occurrences of misspelled word

``` markdown
:spellr

]s .......... next misspelled word
=z .......... accept sugestions
1=z ......... accept first sugestion
zg .......... add word as good
zw .......... add word as "wrong"
zuw ......... undo add word as wrong
zug ......... undo add word as good one
```

# How add a line after every few lines in vim
+ https://stackoverflow.com/a/10414708/2571881

     :%s/^/\=(line(".")%4==0?"\n":"")/g

This solution makes use of ternary oparator that gives us a newline "\n" or
nothing "" depending on rest of division of line number "line('.')" by 4

# Vim - Adding empty line between lines
+ https://superuser.com/a/592508/45032

How do I insert a blank line between every non-blank lines?

eg. from

    line 1
    line 2
    line 3

    line 4
    line 5

to

    line 1

    line 2

    line 3

    line 4

    line

Vim's :g command is designed for exactly this sort of task; running a single
action on every line which matches a particular pattern. Here's my answer:

    :g/.\n\n\@!/norm o

The pattern I use is `/.\n\n\@!/.` Breaking that down into its component pieces:

    . Matches any character in the line. (used to immediately discard any existing empty lines from consideration)
    \n Matches a single \n at the end of the character above
    \n\@! Fails the match if there's another \n immediately after the earlier \n.

(Check `:h E59 `for more information on `\@!` and similar match specifiers in
regular expressions -- there are a couple others, too!)

# How add a new line after a pattern

    :%s/PATTERN/&\r/g

    add a line before a pattern

    :g/^wget/ normal O

# How to add a line after every few lines in vim

I wanted to add a line after every 3 lines in a file (having about 1000 lines)
using vim editor. Can someone help me out?

Solution one:
    :%s/\v(.*\n){3}/&\r
Solution two:
    :%s/^/\=(line(".")%4==0?"\n":"")/g

# How join lines whithin xml <div>s

     :g/<div>/+1,/<\/div>/-1 join

    :g/one/+1,/two/-1 w ~/tmp/test.txt

# Vim search pattern for a piece of text line yanked in visual mode

First you would select and copy chunk of text, after that you
start a search typing /  then you press Ctrl-r 0

This tip was copied in stackoverflow in this link http://va.mu/UIs6

# How do condicional replace on vim
from: http://stackoverflow.com/questions/8814069/

``` vim
" como substituir uma palavra em uma linha que começa com -
:%g/^-/s/word/WORD/g
```

# Saindo temporariamente do vim para o shell

        Ctrl-z

Execute os comandos do shell

        fg

# Apagando linhas intercaladas
Vim: how to delete every second row?

reference: http://stackoverflow.com/questions/1946738/

    g/^/+d

# Como saber onde um atalho de teclas foi definido no vim

``` vim
:verbose map atalho
:verbose command Dos2Unix
```

# Remapear caps lock para ESC

        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Vim - paste in insert mode?

While in insert mode hit CTRL-R {register}. For example, CTRL-R * will
insert in the contents of the clipboard and CTRL-R " (the unnamed register)
inserts the the last delete or yank.

To find this in vim's help type :h i_ctrl-r

# Vim How to paste text into Vim command line

``` markdown
Ctrl-r 0

0 (yank register),
1 to 9 (shifting delete registers),
_ (like /dev/null, this is a black hole),
" (default register, hence the Ctrl-R, "),
- (small delete register),
/ (the search pattern register),
: (last command register),
a to z for your own use (capitalized A to Z are for appending to corresponding registers).
@@ or @" ..... unnamed register

So, @@ will have the value of the text deleted with a d, c, s or x command, or the the text yanked with a y command.
```

See :help registers for the full reference.

# Editando arquivos remotamente

    :e scp://username@someremotehost/./path/to/file

	gvim scp://manager@192.168.1.11/./bashrc

# Alias para abrir arquivos recem editados

``` vim
" coloque no ~/.bashrc
alias lvim='vim -c "normal '\''0"'
alias lnvim="nvim -c':e#<1'"
```

Opening the last nvim file:

``` viml
" This function allows you to open the last edited file
" Reference: https://www.reddit.com/r/vim/comments/fx6l5/
fun! MruFile()
    let filename = get(v:oldfiles, 0, '')
    if filename != ''
        exe "edit " . filename
    endif
endfun
nmap ,l :call MruFile()<cr>
command! -nargs=0 Mrf call MruFile()

```

# Mostrando os ultimos arquivos editados baseado em um padrão
+ https://vi.stackexchange.com/a/11829/7339

    :browse filter /pattern/ oldfiles

Pode-se abreviar

    :bro filter /dicas/ ol

# Multiple choice substitute

    person: Alice
    dog: Tobby
    person: Bob

    Pattern 1 :%s/person:/woman:/c

    Pattern 2 :%s/person:/man:/c

Pattern 1 and 2 have the same search pattern but different replacement
patterns. I want to unify them into one pattern with the option of pressing (1)
for replacement 1, (2) for replacement 2 or (n) for no replacement.

The implementation of :s//c is fixed; what you're looking for is replacement
with a Vimscript expression (:help sub-replace-expr). You can query a
single-digit via getchar(), or prompt for longer numbers via input():

    :%s/person:/\=get(['woman', 'man'], getchar() - char2nr(1), submatch(0)) . ':'/
    :%s/person:/\=get(['woman', 'man'], input('Your choice: ') - 1, submatch(0)) . ':'/

You can enter a higher number (3 in your example) to perform no replacement.

If you need this often, it would make sense to define a custom Query() function
for that. In there, you could also add a :redraw, so that you see the
replacements that have already happened.

# Vim delete HTML tag, but not content

    yit vat p

What this does is yanks:

    y - yanks
    it - the inside of the tag
    vat - selects the entire tag
    p - pastes the previously yanked text over it

# VIM: append to clipboard

http://stackoverflow.com/questions/6303882/

    let @+ = @+ . my_expression

or shorter:

	let @+ .= my_expression

Reference: :help :let.=

# Put the clipboard content into a register

	:let @a="<C-r>*"

# Navegando em linhas longas no vim

``` markdown
gj ............ desce
gk ............ sobe
```

# Como buscar pela palavra sob o cursor?

 ``` vim
 *  ........... busca para frente
 #  ........... busca para traz
 ```

# Como sair do vim direto do modo normal

        ZZ .......... o mesmo que :x

# Como colar texto posicionando o cursor depois do texto?

    Em modo insert <Ctrl>r +
    em modo normal "+gp

# Como fechar o arquivo sem fechar o vim?

      :bd!

      :enew .......... é melhor porque preserva o arquivo anterior na lista de buffers

      Source: http://stackoverflow.com/q/256204/

# Para carregar uma função do vim que está na área de transferência

      :@"

O nome da função estará disponivel para ser chamado normalmente com o comando call (por exemplo):

    :call FuncName()

# Pular para fechamento ou abertura de uma função

 se temos uma função do tipo:

``` vim
nome () {
bla bla bla
bla bla bla
bla bla bla
bla bla bla
bla bla bla
}
```

    Podemos pular para a chave de abertura ou fechamento
    simplesmente usando [{  ou ]}

# Incrementando números ou decrementando com uma função

source: http://stackoverflow.com/q/4951533/

Se eu tiver um arquivo assim:

``` markdown
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
```

E QUISER ASSIM

``` markdown
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_9 {
background: url(stars.png) no-repeat 0 -18px;
}
.star_8 {
background: url(stars.png) no-repeat 0 -36px;
}
.star_7 {
background: url(stars.png) no-repeat 0 -54px;
}
```

** Função para decrementar a sequência acima **

``` vim
let g:decr = 11

fu! Decr()
    let g:decr = g:decr - 1
    return g:decr
    endfu

:%s/.star_10/\=".star_" . Decr()/
```

Outro modo de fazer é rodar o comado:

       '<,'>g/star/ normal<c-v><c-a>

Lembrando que o Control-v é para inserir o Control-x
que decrementa em modo normal

# Como selecionar texto recém colado

``` markdown
`[  ...... inicio do trecho colado
v   ...... seleção visual
`]  ...... fim do trecho colado
V`] ...... reseleciona trecho colado
`[v`] .... reseleciona trecho colado
'[ ....... local anterior ao último insert
```

# Abrir ajuda em tela cheia em nova aba

      :tab h

# Incrementando números em modo normal

``` markdown
Ctrl-a ........... incrementa em um
10 Ctrl-a ........ incrementa em dez

"OBS: Ctrl-v Ctrl-a para inserrir Ctrl-a

 g/identifier/ normal 20^A
```

Para incrementar o trecho width="32", ou seja, um trecho
começado com width contendo dois dígitos faz-se assim

    :%s/width="\zs\d\{2}\ze"/\=submatch(0)+10/g

# Copiando linhas que contém um padrão para um registro

    :g/pattern/y A

Exibir apenas as linhas que contém um padrão

    :g/pattern/#

# Remapeando a tecla ESC

veja o arqtigo neste link
http://vim.wikia.com/wiki/VimTip166

# Trabalhando com intervalos
Numa substituição se desejar atuar sobre linhas subsequêntes
a um determinado ponto é possível omitir a linha atual como visto
abaixo.

    :,+7s/^/foo/

    "salvando da linha 1 a 7 do arquivo atual em novo arquivo
    :1,7 w ~/tmp/teste.txt

# Sobrescrevendo algo entre aspas

    vi"p

# Salvar um intervalo em outro arquivo

    :25,$w teste.txt

# Modo alternativo de sair do modo insert

Ao invés de usar <Esc> para sair do insert use:

    Ctrl + [

# Retirando a syntaxe das buscas

    :noh

ou

    map <leader>h :set hls!<cr>

# Como colocar a palavra sob o cursor em uma substituição

      :%s/<c-r><c-w>/new-word/g

Para colocar o nome do arquivo em uma substituição faça

      /<c-r>%

# Brincando com regex no vim
+ https://stackoverflow.com/a/45600892/2571881

No stackoverflow apareceu a seguinte questão

Replace all strings except the parenthesis part in vim
I have a text as follows.

	cat
	dog
	elephant
	cat (1)
	zebra(1)
	snow leopard
	shark (other)

and I want to replace them as follows.

	[[cat]]
	[[dog]]
	[[elephant]]
	[[cat]] (1)
	[[zebra]](1)
	[[snow leopard]]
	[[shark]] (other)

	/\v(^\w+( \w+)?)
	:%s,,[[\1]],g

	Utilizamos o modo very magic que nos permite
	usar expressões regulares modernas

	A expressão regular usada é composta de dois grupos
	sendo que o segudo está dentro do primeiro, na substituição
	usamos só o primeiro

	uma palavra pelo menos --> \w+
	seguida de outro grupo opcional ( \w+)?

Ví soluções mais complexas, e aí resolvi tentar, depois de mais de uma hora quebrando a cabeça, pois meu objetivo era aprender um pouco mais sobre regex no vim e de modo greal, pois é um assunto que me intriga.

Para poucas linhas de código, obviamente a solução manual é a melhor escolha, mas imagina se esse código tivesse centenas de linhas, o que provavelmente corresponde à realidade do cara que a postou.

# How search for a word not preceded by another

    /\v(the )@<!word    any "word" not preceded by "the"
    /\vfoo( bar)@!      any "foo" not followerd by "bar"

    Capability                  in Vimspeak   in Perlspeak
    ----------------------------------------------------------------
    force case insensitivity    \c            (?i)
    force case sensitivity      \C            (?-i)
    backref-less grouping       \%(atom\)     (?:atom)
    conservative quantifiers    \{-n,m}       *?, +?, ??, {}?
    0-width match               atom\@=       (?=atom)
    0-width non-match           atom\@!       (?!atom)
    0-width preceding match     atom\@<=      (?<=atom)
    0-width preceding non-match atom\@<!      (?<!atom)
    match without retry         atom\@>       (?>atom)

the folowing searcch will match 'word' not preceded by 'the'

    /\v(the )@<!word

    the word
    one word
    find word

# Delete anything other than pattern

Let's say this is my text:

    this is my text this
    is my text this is my text
    my text is this

I would like to highlight all text except pattern and delete the highlighted text.
p.e. text: this must be the result.

    text
    texttext
    text

Solution

    /\v(^|(text)@<=).{-}($|text)@=
    %s,,\1,g

```viml
/\v(^|(text)@<=)   # means start of line, or some point preceded by “text”
.{-}               # as few characters as possible
($|text)@=         # without globbing characters, checking that we reached either end of line or occurrence of “text”.

    type :help /\@<= and :help /\@= or more generally :help pattern

# In Vim how can I search and replace every other match?
+ https://stackoverflow.com/a/45785816/2571881

Lets say you have

    <block>
        <foo val="bar"/>
        <foo val="bar"/>
    </block>
    <block>
        <foo val="bar"/>
        <foo val="bar"/>
    </block>

How could I make that into

    <block>
        <foo val="bar1"/>
        <foo val="bar"/>
    </block>
    <block>
        <foo val="bar1"/>
        <foo val="bar"/>
    </block>

    \v%(block>\_.{-})\zsbar1
    %s,,&1,g

    \v ............ very magic (avoid lots of scapes)
    %  ............ ignore whats flows
    (  ............ starts (ignored) group
    \_ ............ multiline search
    .{-} .......... non-greedy
    \zs ........... start pattern for substituition
    bar  .......... pattern we want to change

    % ............. whole file
    s ............. substituition
    ,, ............ use last search (could be //)
    & ............. use searched pattern
    1 ............. add 1 after it

# Some regex tips

``` markdown
"if " not followed by "then"

if \(\(then\)\@!.\)*$

To represent a NOT, use the negative assertion \@!.

For example, "NOT Bush" would be:

^\(.*Bush\)\@!

or using \v:

\v^(.*Bush)@!
```

Let's say I have some lines like below and I want to find bar
only if it is preceded by foo

 ``` markdown
 foobar
 bazbar
 foobar
 fooother
 quxbar
 ```

The solution search pattern would seems like this:

``` markdown
/\v(foo)@<=bar .............. @<=bar (negates bar)
/\vfoo(bar)@! ............... @! also negates bar

\(foo\)\@<!bar		any "bar" that's not in "foobar"
\(\/\/.*\)\@<!in	"in" which is not after "//"
```

You can also use the tilde character (~) as your search pattern, and when
running your substitution, Vim will interpret the tilde as the value of your
last replacement. So, if you already executed a substitution in which you
replaced the pattern matched with the characters +++ but realized you made a
mistake and the +++ should have been !!!, you can quickly rectify the problem
by executing another substitution, like so: :%s/~/!!!/g.

``` vim
qu\@!  " matches a q that's not followed by a u. (This is more correct than
q[^u], " which requires that there is some character after the q.)
```

to match on f, fo, foo, or food, the pattern `f\%[ood]` can be used. In PCRE,
such a pattern would look like `f(o(od?)?)?`. (Imagine that for a longer string!)

**Non-capturing group**

``` vim
\%^   .......... the beginning of the file
\%( \) ......... a non-capturing group
\{-}   ......... repeated 0 or more times (as few as possible)
```

This helps you to use a patter in search and not use it in groups

Vim's regex has some anchors for matching positions in the buffer.

``` markdown
\%23c matches column 23
\%<23c matches before column 23
\%>23c matches after column 23
\%16l matches line 16

    Similar to column, there are anchors for before or after a line number

\%# Matches the cursor position
```
This is useful for things like [highlighting trailing whitespace except when you're typing at the end of the line](http://vim.wikia.com/wiki/Highlight_unwanted_spaces)

##  Anoter approach to similar situation

  If you have to change or copy only quoted text but
  not want to catch quotes you [can](can) make use of this vim resource:

      /\v"\zs[^"]+\ze"

``` markdown
/ ................... starts searching
\v .................. very magic (avoid scapes)
" ................... literal quote
\zs ................. tells vim to start selecting from this point
[^"]+ ............... non quote followed at least for one non quote
\ze ................. tells vim to stop selecting at this point
```

# Finding words no larger than 5 chars

    /\v<\w>{5}

    \v .......... very magic
    < ........... word boundary (start)
    > ........... word boundary (end)
    \w .......... word
    {5} ......... exactly 5 chars

    /\v<\w{1,5}>\ze

    In the previous search "words 1 up to five chars" ignoring
    white spaces \ze stands for end of search

# Regex to uppercase multiple patterns at once

Let's say you have these lines:

``` markdown
class XhtmlDocument < XmlDocument; end
class XhtmlTag < XmlTag; end
```

And you want to uppercase "Xhtml" "Xml" at once

    :%s,\vX(ht)?ml,\U&,g

# Regex para pegar aspas simples

source: http://vimcasts.org/episodes/refining-search-patterns-with-the-command-line-window/

``` markdown
This string contains a 'quoted' word.
This string contains 'two' quoted 'words'.
This 'string doesn't make things easy'.
```

This string doesn't contain any quotes, isn't it.

    " a busca

``` vim
\w\@<!'\(\(\w'\|[^']\)\+\)'\(\w\)\@!  - without very magic

\v\w@<!'((\w'|[^'])+)'(\w)@! - very magic option

```

``` markdown
----------------------------------------------------------
" a explicação
----------------------------------------------------------
\v ........... very magic
\w@<!' ....... qualquer ' que naõ tiver uma palavra antes dele
\w|[^']+ ..... uma palavra ou não colchete ao menos uma vez
'(\w)@! ...... apóstofro que não tem uma palavra depois dele

%s/\v\w@<!'((\w'|[^'])+)'(\w)@!/"\1"/g
```

# Numerando linhas com novo comando
source: http://stackoverflow.com/q/4224410/

``` vim
command! -nargs=0 -range=% Number <line1>,<line2>s/^\zs/\=(line('.') - <line1>+1).' '
```

``` vim
" para inserir numeração de linhas de dois dígitos
:%s/^/\=substitute(printf("%2d",line("."))," ","0","g")
```

# Abrindo e fechando folders com o mouse

``` vim
" se setar-mos como abaixo mostra os subníveis dos folders
set foldcolumn=3
```

``` markdown
zi ................  opens and closes all folders
za ................  toggles current fold
zO ................  open all folders
zM ................  close all folders
zj ................  go to start of next fold
zk ................  move to the end of previous fold
```

    zMzv ..........  closes all folders and opens at the cursor position
    set foldmethod?  shows current foldmethod

# I have a file which has contents like so:
+ https://stackoverflow.com/a/45477513/2571881

    size is X1 Identifier is Y1
    size is X1 Identifier is Y1
    size is X1 Identifier is Y1

I want to re-arrage the file so that I get

    Identifier is Y1 size is X1
    Identifier is Y1 size is X1
    Identifier is Y1 size is X

    %s,\v(.*) (I.*),\2 \1

# Colando o que foi selecionado com o mouse

    ``` markdown
    `Ctrl-r *` Or `"*p`
    ```

    Asterisco corresponde à seleção primária
    o que foi recentemente copiado fica no registro 0

# Artigos e links legais sobre o vim

 * http://stevelosh.com/blog/2010/09/coming-home-to-vim

# Vim script

* http://www.swaroopch.com/notes/Vim_en:Scripting

para ecoar uma lista

     :ec split('uma lista de palavras')

Para exibir o tamanho da linha atual

     :ec strlen(getline('.'))

 Para exibir o tipo do arquivo

     :ec &filetype

``` vim
function CurrentLineLength()
    let len = strlen(getline("."))
    return len
endfunction
```

See :help function-list for a huge list of functions available.

# Para listar o caminho completo de cada esquema de cores do vim

``` vim
ec split(globpath(&runtimepath, 'colors/*.vim'),"\n")

" coloca cada cor instalada localmente em uma variável g:mycolors

let g:mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")

ec split(glob(expand("$HOME")."/.vim/colors/*.vim"), "\n")
```

# Script para trocar o esquema de cores

* http://vim.wikia.com/wiki/Switch_color_schemes

# Setando o programa grep

Instale o programa grin

``` markdown
sudo easy_install grin

no vimrc   set grepprg=grin

:grin -il padrão

:clist

Para abrir os arquivos que correspondem ao padrão

:copen ......... abre a lista - use Ctrl-w-f
```

# Usando o grep nativo do vim

``` vim
" para continuar usando autochdir configure o formato do erro
set grepformat=%f:%l:%m
```

``` vim
:vim /\cpattern/gj ~/.vim/**/*.wiki
:noautocmd vim /\cdica/gj ~/.vim/**/*
:cn
```

    o comando :lw equivale a :cope

    nnoremap <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<CR>

    :vimgrep /{searchTerm}/[gj] {/path/to/project/**/*.rb}

    Para visualizar buscas prévias use:

        :colder

        ou para buscas mais antigas:

        :cnewer

# Como exibir as opções de formatação?

``` vim
:ec &fo
:ec &rtp
```

# Como indentar um bloco de código vuado

     ={

     ou

     ==

" retira a indentação das próximas 99 linhas

     :%< 99

# Atalhos para marcas

``` markdown
]' .......... próxima marca
[' .......... marca prévia
```

# Função para criar marcas visíveis

``` vim
function! SignLines() range
  let n = a:firstline
  execute(":sign define fixme text=>> texthl=Todo")
  while n <= a:lastline
    if getline(n) =~ '\(TODO\|FIXME\)'
      execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
    endif
    let n = n + 1
  endwhile
endfunction
map <S-F5> :call SignLines()<CR>
```

# Saltos para alterações

``` vim
g, ............... alteração mais recente
g; ............... alteração mais antiga
g` ............... jump to the last know position without changing jumplist
```

### Jumping to the begining/end of the last yanked/changed text

``` viml
`[ or `] ......... jump to beginning/end of previously changed or yanked text
`< or `> ......... jump to beginning/end of last visual selection
```

``` markdown
m< ............... define o começo da seleção "gv"
m> ............... define o fim da seleção "gv"

OBS: If last selection was linewise the new positon will be set accordingly,
     the same happens if the last selection was blockwise
```

somente lista de saltos

    Ctrl-o
    Ctrl-i

# Manipulando o histórico

``` vim
q:
q/
```

ou abra a linha de comando e pressione

    Ctrl-f

Outro modo é digitar o comando:

    :cedit

Para fechar a janela do histórico

      Ctrl-w-q

``` markdown
O registro @: contém o último comando e
o registro @/ contém a última busca
```

# Limpando um registro de forma fácil

      qaq .......... limpa o registro 'a'

      let @a=''

# Corretor ortográfico do vim

    Fonte: http://www.dicas-l.com.br/arquivo/corretor_ortografico__em_portugues__no_vim.php

Baixar o dicionário atualizado em
http://www.broffice.org/files/pt_BR-2010-01-09AOC.zip Descompactar o dicionário
No mesmo diretório que estiver os arquivos descompactador, iniciar o vim e
executar o seguinte comando:

  ``` vim
  :mkspell pt pt_BR
  ```

(esse comando demora alguns minutos)
Copiar o arquivo gerado neste diretório, chamado pt.utf-8.spl, para ~/.vim/spell
Após a instalação do dicionário, para habilitar o corretor ortográfico (em português) no vim, basta digitar:

``` vim
:set spell spelllang=pt
:setlocal spell spelllang=en_us
```

    Uma vez no vim, com o corretor ligado, basta digitas os seguintes comandos para as tarefas mais básicas:

``` markdown
]s 	move o cursor para a próxima palavra "errada"
[s 	move o cursor para a palavra "errada" anterior
zg 	adiciona a palavra (no dicionario) em que o cursor está em cima.
zug 	remove a última palavra adicionada no dicionario
z= 	Vê as sugestões para uma palavra certa, e troca se você escolher alguma delas.

No modo insert, quando o cursor estiver após uma palavra marcada com erro
você pode usar Ctrl-x s para procurar sugestões. Use Ctrl-n ou Ctrl-p para
voltar. i_CTRL-X_s
```

# Seleção

see [vim text objects the definitive guide](http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)

    cis .............. change inner sentence
    yat .............. copy a tag
    vip .............. visual select inner paragraph

selecionar

``` markdown
# see more: https://gist.github.com/sjl/1171642
Trecho entre parênteses  ......... vi(
Entre parênteses (inclusive) ..... v%
Trecho entre aspas ............... vi"
Seleciona um parágrafo ........... vip
Selection uma sentença ........... vis
Seleciona próximo ( .............. %vi(
```

  Pode usar copiar ao inves de visual

``` markdown
yi"
yi(

Ou deletar

di"

ou ainda

ci"
ci(
cib
```

# Movendo-se

``` markdown
fx ........... para o próximo 'x'
Fx ........... para o prévio 'x'
tx ........... antes de próximo 'x'
Tx ........... antes de prévio 'x'
gf ........... go to file
gd ........... go to definition
```

# Completar caminhos no modo insert

    Ctrl-x Ctrl-f

    Completar:
    Linhas  .................... Ctrl-x Ctrl-l
    Palavra (arquivo corrente) . Ctrl-x Ctrl-n
    Palavra dicionário ......... Ctrl-x Ctrl-k
    Palavra tesaurus ........... Ctrl-x Ctrl-t
    Palavra arquivos incluidos . Ctrl-x Ctrl-i
    tags ....................... Ctrl-x Ctrl-]
    definições de macros ....... Ctrl-x Ctrl-d
    linha de comando ........... Ctrl-x Ctrl-v
    definições de usuário ...... Ctrl-x Ctrl-u
    omni completion ............ Ctrl-x Ctrl-o
    sugestões de spelling ...... Ctrl-x _s
    complemento ................ Ctrl-x Ctrl-n

# Manipulando buffers

    :ls ............... lista os buffers
    :b mat<tab> ....... mostra os buffers começados com 'mat'
    :bd  .............. tira o buffer atual da lista
    :bufdo ............ executa um comando para todos os buffers

    :bdelete N1 N2
    :N,M bdelete
    :bn ............... buffer next
    :wn ............... save buffer and go next

# Função para inverte strings no vim

    function! InvertString(str)
        " Courtesy of Preben "Peppe" Guldberg
        " This will invert/reverse a string
        " This will work on arbitrary length strings, too. The /.*/ should be
        " quick, which might make it up for using a regex rather than using
        " numerous commands in a :while loop.
        "
        " This can be used in a substitute command as follows:
        " :%s/AUTHORIZATION/\=InvertString(submatch(0))
        let inverted = substitute(a:str, '.\(.*\)\@=',
                    \ '\=a:str[strlen(submatch(1))]', 'g')
        return inverted
    endfunction

    " em modo normal
    map <Leader>rv Yo<C-O>:set revins<cr><C-R>"<esc>:set norevins<cr>

# Comando para inverter palavras de uma linha

    inverter uma string por palavras

    source: http://stackoverflow.com/q/5532431/

    command! ReverseLine call setline('.', join(reverse(split(getline('.')))))

# Como definir a fonte no vim
[referencias: Ask Ubuntu](http://askubuntu.com/q/363142)

Você pode até escolher a fonte graficamente e em seguida
copie a saida deste comando

     :set gfn?

Agora coloque no vimrc o resultado

     set anti gfn="nome da fonte que você pegou"

Alternatively, enter the following to insert the current font setting into the buffer:

    :put =&guifont

   ** no modo gráfico (gvim) **

    :set anti gfn=Ubuntu\ Mono\ for\ PowerLine:h13

Você pode também aumentar a fonte do terminal (se estiver usando um)
com o atalho `Ctrl-Shif-+`

# Contando quantas vezes uma palavra ocorre

You can use the following set of commands to count the number of times a
particular word occurs in a buffer: >

``` vim
:let cnt=0
:g/\<your_word\>/let cnt=cnt+1
:echo cnt
```

# Name spaces para variáveis no vim

There are several name spaces for variables.  Which one is to be used is
specified by what is prepended:

(nothing) In a function: local to a function; otherwise: global
|buffer-variable|    b:	  Local to the current buffer.
|window-variable|    w:	  Local to the current window.
|tabpage-variable|   t:	  Local to the current tab page.
|global-variable|    g:	  Global.
|local-variable|     l:	  Local to a function.
|script-variable|    s:	  Local to a |:source|'ed Vim script.
|function-argument|  a:	  Function argument (only inside a function).
|vim-variable|	     v:	  Global, predefined by Vim.

# Contar os caracteres da linha atual

    :echo strlen(getline("."))

    :let len = strlen(getline("."))
    :echo "We have" len "characters in this line."

    :function Currentlinelength()
    :    let len = strlen(getline("."))
    :    return len
    :endfunction

# Contar ocorrências de uma palavra

  :%s/<c-r><c-w>//gn

# Dicas para substituições

 A opção \zs quando usada em uma substituição faz com
que tudo que estiver a sua esquerda seja ignorado na substituição
evitando o uso de \1 \2 (back references das expressões regulares)

Para mais detalhes :h zs

# Como instalar plugins com a extensão vba no vim

Plugins com a extensão vba usam o seguinte método:
você baixa o plugin, abre ele com o vim e executa este comando

   :so %

Mas para quem usa o plugin

Ao instalar um plugin com extensão vba 'vimball' você pode listar
quais arquivos serão instalados assim:

 `  :VimballList    `

  Pode ainda determinar um local no qual os arquivos vba serão
  colocados ao usar o comando :so

  Para isto use:

    :usevimball ~/.vim/bundle/bundle-dir-name-here
     veja o help :h :usevimball

    OBS: troque o nome de usuário no comando abaixo para corresponder ao seu usuário

    :let g:vimball_home="/home/sergio/.vim/bundle/plugin"
    :so %

# Manipulando visualização da janela e lista de saltos

    let a = winsaveview()
    call winrestview(a)

    veja :h keepjumps

        keepjumps command

   Para saltar para a posição da alteração mais recente use Ctrl-i
   Para saltar para a posição da alteração mais antiga use Ctrl-o

   há uma discussão na web a respeito desta função
   http://tech.groups.yahoo.com/group/vim/message/51005

# Exibindo o histórico de comandos no vim

     :history : -20,
     :his / -20,

# Plugins do vim

First try install vim Plug

    ``` sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

``` vim
:PlugInstall(!) - install (update) plugins
:PlugUpdate
:PlugClean

Plug 'rking/ag.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'kien/ctrlp.vim'
Plug 'ompugao/ctrlp-z'
Plug 'sjl/gundo.vim'
Plug 'edsono/vim-matchit'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/NrrwRgn'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'bling/vim-airline'
Plug 'eparreno/vim-l9'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/VisIncr'
```

**Plugin list**

    Plug tommcdo/vim-exchange .................... exchange words
    Plug 'chrisbra/NrrwRgn'....................... operates over a selected area

# Exchanging words place

Using [vim exchange](https://github.com/tommcdo/vim-exchange) plugin we can exchange
words place by doing:

    cxiw ..................... exchange inner word
    .   ...................... type dot in the other word

    cxi)  .................... exchange inner parenthesis block
    .  ....................... type dot to finish the operation

    cxc ...................... clears exchange operation

Without vim-exchange plugin you can switch two words by doing

    dWwP

    dW ............ delete words even hyphenated ones
    w ............. jump to the next word
    P ............. paste before

# Trabalhando com janelas

       Ctrl-w Ctrl-6 ..... divide a janela e edita arquivo alternativo

# Colando do clipboard em modo insert

Em modo normal colamos o conteúdo da área de transferência usando o clássico "+p já em modo insert faça:

       <Ctrl-r>+
       <Ctrl-r>"

The Control-R mechanism is very useful:-

        :h i_CTRL-R

Usually used for inserting the contents of a register 0-9a-z
but can also insert the following special registers etc

``` markdown
'"' the unnamed register, containing the text of the last delete or
yank
'%' the current file name
'#' the alternate file name
'*' the clipboard contents (X11: primary selection)
'+' the clipboard contents
'/' the last search pattern
':' the last command-line
'.' the last inserted text
'-' the last small (less than a line) delete
=5*5 insert 25 into text (mini-calculator)
```

The paste buffer is usually the easiest way to transfer text between VIM and
another application.

``` vim
" Redirection & Paste register *
:redir @* : redirect commands to paste buffer
:redir END : end redirect
:redir >> out.txt : redirect to a file
" Working with Paste buffer
"*yy : yank current line to paste
"+y} : yank to end of paragraph
"+yi{ : yank current paragraph
"*p : insert from paste buffer
" yank to paste buffer (ex mode)
:'a,'by* : Yank range into paste
:%y* : Yank whole buffer into paste
:.y* : Yank Current line to paster
" filter non-printable characters from the paste buffer
" useful when pasting from some gui application
:nmap p :let @* = substitute(@*,'[^[:print:]]','','g')"*pr
```

# Convertendo temas do texmate para o vim

http://coloration.sickill.net/

programa para possibilitar a conversão de esquemas de cor do texmate (binario para xml1)
http://vimcasts.org/episodes/creating-colorschemes-for-vim/
usando este site: http://coloration.sickill.net/

    apt-fast install -y libplist-utils

# Videos bacanas sobre o vim

http://vimeo.com/user1690209/videos

muito louco, tranformando um xml em texto plano http://vimeo.com/15443936

# Busca dentro de seleção visual

``` vim
/\%V
:%s/\%Visto/aquilo/ge
```

# Como abrir vários arquivos no gvim

      :args ~/path/*.py

isto evita o erro E77: muitos arquivos para editar

# Deletando linhas que não contém padrão

    :v/pattern/d

# Using global to join lines

If you have the following pattern

    hostname:
    output
    hostname2:
    output2

And want to change to this:

    hostname: output
    hostname2: output2

You can use a global negator like this:

    :v/:$/-1j

for those which don't match the following regular expression (v) /(regular
expression of lines ending in colon)/ go to the previous line (-1) and join
that line to the next one (j)).

# Destacando as linhas duplicadas

    :g/^\(.*\)\n\ze\%(.*\n\)*\1$/#

# incrementar as linhas contendo "# Lesson + number"

    :.,$g/# Lesson \d\+/normal 

    . ................ linha atual
    $ ................ final do arquivo
    g ................ comando global
    /.../ ............ padrão de busca
    normal ........... executa em modo normal
    ^v^A ............. incrementa o número

# Delete multiline comments using global command
+ https://stackoverflow.com/a/45853309/2571881

I am trying to delete a bunch of comments that are all in the following format:

    /**
     * @ngdoc

     ... comment body (delete me, too!)

    */

The best solutions I think are:

    Using macro
    qa/\/\*\*<Ctrl-v><Enter>V/\*\/<Ctrl-v><Enter>d

    :g/\v^\/\*\*$/,/\*\/$/d_

Or using a global command. (both are similar)

    :g  .......... starts global command
    /^\/\*\*  .... comment beginning
    $ ............ end of line
    , ............ interval delimiter
    /\*\/$d_ ..... delete until the end to the black hole register "d_"

# get multiline mp3 links

The key to get mp3 links over multilne is to search for:

    /http.*\_.mp3

After that you can manipulate your html in order to clean the links
accordingly with the situation

# How to use vim to do multiple line edit?
+ https://stackoverflow.com/questions/44172121/

I have text like this:

    w ky,
    wyz,
    wyy,
    wj,
    w w,

now I want to change to this:

    "w ky",
    "wyz",
    "wyy",
    "wj",
    "w w",

My solution
    %s/\v(\w ?\w+),/"\1",/g

# Pegar linha que começa com palavra e sublinhar

    g/^\w/t.|s/./=/g

# Adicionar uma linha em branco após linhas que começam com espaço

    :g/^\s\+/normal o

# Função para deletar linhas em branco duplicadas

``` vim
fun! DelBlank()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :g/^\n\{2,}/d
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
map <leader>d :call keepjumps DelBlank()<cr>
```

``` vim
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let save_cursor = getpos(".")
    let old_query = getreg('/')
        execute a:command
    " Clean up: restore previous search history, and cursor position
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction"}}}
```

# Adding blank lines  - adding empty lines between lines
source: [superuser.com](http://superuser.com/q/592503/)

    :g/.\n\n\@!/norm o

The pattern I use is `/.\n\n\@!/`. Breaking that down into its component pieces:

. Matches any character in the line. (used to immediately discard any
existing empty lines from consideration) \n Matches a single \n at the end
of the character above \n\@! Fails the match if there's another \n
immediately after the earlier \n.

# Visualizar o histórico de comandos do vim

Com o cursor na linha de comandos do vim pressione <C-f>

``` vim
:redir @a>  ......... redireciona para o registro 'a'
:history : -20,
:redir END
"ap
```

Outro modo de colar o regitro "a" é pressionar Ctrl-r Ctrl-r a

Comando para colar o histórico dos ultimos 22 comandos

     q:22kyG Ctrl-w-q p

# Mapeamento para inserir números randomicos no vim

``` vim
imap <leader>r <C-r>=system('echo "$(($RANDOM % 100))"')<cr>
```

# Adicionado espaços em títulos markdown

Se você tem um título ou subtitulo markdown com o texto
colado no titulo como em  ##titulo podemos adicionar um espaço assim:

``` vim
%s/\v(^#{1,3})([a-z])/\1 \2/g
```

``` markdown
grupo 1 ---> comço de linha # Ou mais
grup 2  ---> tudo menos # E espaço
```

# Fazer com que subseções markdown virem subsubseções

``` vim
:g/^##[^#]/ normal I#
```

Obs: os caracteres ^[ são obtidos digitando-se Ctrl-v + [

# Trocar título tipo == assim == para markdown

O código abaixo troca dois iguais por três ###

``` vim
%s/\v^\=\=([^\=]+)\=\=/### \1/g
```

[#](#) How to convert html to markdown using vim-pandoc
[link here](http://amandogra.github.io/blog/how-to-convert-html-to-markdown-using-vim-pandoc/)

## Install pandoc
after that install these plugins with your favorite vim plugin manager

``` vim
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
```
In my case I usually create a function to this task

``` vim
fun! HtmlToMarkdown()
    :%!pandoc -f html -t markdown<CR>
endfun
command! -nargs=0 H2M :%!pandoc -f html -t markdown<CR>
```

# Adding markdown sections

``` txt
Lets say you have lines as folows
---------------------------------

amixer is a command-line mixer for ALSA soundcard driver.

Increase volume by 10%

    amixer set 'Master' 10%+

Decrease volume by 10%

    amixer set 'Master' 10%-

Set volume to 10%

    amixer set 'Master' 10%

Set volume to 80%

    amixer set 'Master' 80%

Shows a complete list of simple mixer controls

    amixer scontrols

And you want to add ### at non indented lines

the command will be:

    .,$/^[^ \t]*/### &/g

```

# References
+ http://vi.stackexchange.com/q/2268/
+ http://dalibornasevic.com/posts/43-12-vim-tips
+ https://vimvalley.com/

vim:ft=markdown
