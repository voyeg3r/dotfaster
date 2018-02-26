" NeatStatus (c) 2012 Lukasz Grzegorz Maciak
" Neat and simple status line - because Powerline is overrated
"    _   _            _   ____  _        _
"   | \ | | ___  __ _| |_/ ___|| |_ __ _| |_ _   _ ___
"   |  \| |/ _ \/ _` | __\___ \| __/ _` | __| | | / __|
"   | |\  |  __/ (_| | |_ ___) | || (_| | |_| |_| \__ \
"   |_| \_|\___|\__,_|\__|____/ \__\__,_|\__|\__,_|___/
"   Vim plugin by Luke Maciak (c) 2012 - voyeg3's version
"
" Loosely based on a script by Tomas Restrepo (winterdom.com)
" " Original available here:
" http://winterdom.com/2007/06/vimstatusline
" colors:
"
" Some symbols to use:
"  

set ls=2 " Always show status line
let g:last_mode=""

" Color Scheme Settings
" You can redefine these in your .vimrc

" Black on Green
if !exists('g:NeatStatusLine_color_normal')     "black         green
    let g:NeatStatusLine_color_normal   = 'guifg=#000000 guibg=#76FF03 gui=bold ctermfg=0 ctermbg=2 cterm=NONE'
endif

if !exists('g:NeatStatusLine_color_insert')
    let g:NeatStatusLine_color_insert   = 'guifg=#000000 guibg=#4FC3F7 gui=bold ctermfg=15 ctermbg=9 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_replace')
    let g:NeatStatusLine_color_replace  = 'guifg=#ffff00 guibg=#5f8787 gui=bold ctermfg=190 ctermbg=67 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_visual') "    white         deeppink
    let g:NeatStatusLine_color_visual   = 'guifg=#ffffff guibg=#ff1493 gui=NONE ctermfg=15 ctermbg=53 cterm=NONE'
endif

if !exists('g:NeatStatusLine_color_position')
    let g:NeatStatusLine_color_position = 'guifg=#ffffff guibg=#424242 ctermfg=15 ctermbg=0'
endif

if !exists('g:NeatStatusLine_color_modified')
    let g:NeatStatusLine_color_modified = 'guifg=#ffffff guibg=#5f8787 gui=bold ctermfg=15 ctermbg=0'
endif

if !exists('g:NeatStatusLine_color_line')
    let g:NeatStatusLine_color_line    = 'guifg=#ffffff guibg=#5f8787 gui=bold ctermfg=207 ctermbg=0 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_filetype')
    let g:NeatStatusLine_color_filetype = 'guifg=#ffffff guibg=#2C323C gui=bold ctermfg=0 ctermbg=7 cterm=bold'
endif

" cor da paleta #5f8787
if !exists('g:NeatStatusLine_color_paste')
    let g:NeatStatusLine_color_paste = 'guifg=#000000 guibg=#bbbbbb gui=bold ctermfg=0 ctermbg=7 cterm=bold'
endif

if !exists('g:NeatStatusLine_separator')
    let g:NeatStatusLine_separator = ' | '
endif

"==============================================================================

" Set up the colors for the status bar
function! SetNeatstatusColorscheme()
    " Basic color presets
    exec 'hi User1 '.g:NeatStatusLine_color_normal
    exec 'hi User2 '.g:NeatStatusLine_color_replace
    exec 'hi User3 '.g:NeatStatusLine_color_insert
    exec 'hi User4 '.g:NeatStatusLine_color_visual
    exec 'hi User5 '.g:NeatStatusLine_color_position
    exec 'hi User6 '.g:NeatStatusLine_color_modified
    exec 'hi User7 '.g:NeatStatusLine_color_line
    exec 'hi User8 '.g:NeatStatusLine_color_filetype
    exec 'hi User9 '.g:NeatStatusLine_color_paste
endfunc


"  
fun! Platform()
    if &ff == 'unix'
        return ""
    elseif &ff == 'mac'
        return ""
    else &ff == 'dos'
        return ''
endfun
" placeholder ctrl-j

" pretty mode display - converts the one letter status notifiers to words
function! Mode()
    redraw
    let l:mode = mode()
    if     mode ==# "n"  | exec 'hi User1 '.g:NeatStatusLine_color_normal  | return "NOR"
    elseif mode ==# "i"  | exec 'hi User1 '.g:NeatStatusLine_color_insert  | return "INS"
    elseif mode ==# "R"  | exec 'hi User1 '.g:NeatStatusLine_color_replace | return "REP"
    elseif mode ==# "v"  | exec 'hi User1 '.g:NeatStatusLine_color_visual  | return "VIS"
    elseif mode ==# "V"  | exec 'hi User1 '.g:NeatStatusLine_color_visual  | return "V-L"
    elseif mode ==# "" | exec 'hi User1 '.g:NeatStatusLine_color_visual  | return "V-B"
    else                 | return l:mode
    endif
endfunc

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

"==============================================================================

if has('statusline')

    " set up color scheme now
    call SetNeatstatusColorscheme()

    " Status line detail:
    " -------------------
    "
    " :echo strftime("%R %d-%M-%Y", getftime(bufname("%")))
    "
    " %f    file name
    " %F    file path
    " %y    file type between braces (if defined)
    "
    " %{v:servername}   server/session name (gvim only)
    "
    " %<    collapse to the left if window is to small
    "
    " %( %) display contents only if not empty
    "
    " %1*   use color preset User1 from this point on (use %0* to reset)
    "
    " %([%R%M]%)   read-only, modified and modifiable flags between braces
    "
    " %{'!'[&ff=='default_file_format']}
    "        shows a '!' if the file format is not the platform default
    "
    " %{'$'[!&list]}  shows a '*' if in list mode
    " %{'~'[&pm=='']} shows a '~' if in patchmode
    "
    " %=     right-align following items
    "
    " %{&fileencoding}  displays encoding (like utf8)
    " %{&fileformat}    displays file format (unix, dos, etc..)
    " %{&filetype}      displays file type (vim, python, etc..)
    "
    " #%n   buffer number   ●
    " %l/%L line number, total number of lines
    " %04l line number with zeros 0001
    " %p%   percentage of file
    " %c%V  column number, absolute column number
    " &modified         whether or not file was modified
    "
    " %-5.x - syntax to add 5 chars of padding to some element x
    "
    " v:register - if we are using + 0 or " registers
    "
    " if you want to use syntastic
    " &stl.=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
    "
    function! SetStatusLineStyle()
        " Determine the name of the session or terminal
        if (strlen(v:servername)>0)
            if v:servername =~ 'nvim'
                let g:neatstatus_session = 'nvim'
            else
                " If running a GUI vim with servername, then use that
                let g:neatstatus_session = v:servername
            endif
        elseif !has('gui_running')
            " If running CLI vim say TMUX or use the terminal name.
            if (exists("$TMUX"))
                let g:neatstatus_session = 'tmux'
            else
                " Giving preference to color-term because that might be more
                " meaningful in graphical environments. Eg. my $TERM is
                " usually screen256-color 90% of the time.
                let g:neatstatus_session = exists("$COLORTERM") ? $COLORTERM : $TERM
            endif
        else
            " idk, my bff jill
            let g:neatstatus_session = '?'
        endif

        let &stl=""
        " mode (changes color)
        let &stl.="%1*\ %{Mode()} %0*"
        " session name
        "let &stl.="%5* %{g:neatstatus_session} %0*"
        " buffer number
        let &stl.=" b%n "
        let &stl.="%6*%{GitInfo()}%0*"
        " file path
        let &stl.=" %<%F"
        " modified / unmodified (purple)
        let &stl.="%03(%6*%{&modified ? ' + ':''}%)%0*"
        " read only, modified, modifiable flags in brackets
        "let &stl.="%([%R%M]%) "
        " right-aligh everything past this point
        let &stl.="%= "
        " TODO: show clipboard v V or b and clipboard + 0 or "
        "let &stl.="%{v:register}"
        " readonly flag
        " ec (&ro || !&modifiable ? 'no' : 'yes')
        let &stl.="%6*%(%{(&ro!=0?'  ':'')}%)%0*"
        let &stl.="%6*%01(%{&list?'':''}%)%0* "
        let &stl.="%6*%01(%{&hls?'H':''}%)%0* "
        let &stl.="%6*%01(%{(&paste?'P':'')}%)%0* "
        " file type (eg. python, ruby, etc..)
        let &stl.="%(%{&filetype}%) "
        " file format (eg. unix, dos, etc..)
        "let &stl.=" %{&fileformat} "
        let &stl.="%9* %{Platform()} %0*"
        " file encoding (eg. utf8, latin1, etc..)
        let &stl.=" %(%{(&fenc!=''?&fenc:&enc)}%) "
        "line number (pink) / total lines
        let &stl.=" %03l/%03L "
        " percentage done
        let &stl.="%1* %03p%% "
        " column number (minimum width is 2)
        let &stl.="%02v "
    endfunc

    "FIXME: hack to fix the repeated statusline issue in console version
    if !has('gui_running')
        au InsertEnter  * redraw!
        au InsertChange * redraw!
        au InsertLeave  * redraw!
    endif

    " whenever the color scheme changes re-apply the colors
    au ColorScheme * call SetNeatstatusColorscheme()

    " Make sure the statusbar is reloaded late to pick up servername
    au ColorScheme,VimEnter * call SetStatusLineStyle()

    " Switch between the normal and vim-debug modes in the status line
    nmap <M-d> :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
        set titlestring="%t%(\ [%R%M]%)".expand(v:servername)
    endif
endif
