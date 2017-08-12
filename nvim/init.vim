" File: init.vim
" Author: Sergio Araujo
" Description: Improve nvim
" Last Modified: agosto 11, 2017
" my old vimrc: https://raw.githubusercontent.com/voyeg3r/dotfiles/master/rcfiles/vim/vimrc

if executable('zsh')
    set shell=zsh\ -l
endif

if !has('nvim')
  set viminfo+=n~/.viminfo
endif

set viminfo=%,<800,'10,/50,:100,h,f1
"           | |    |   |   |    | |
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

if empty(glob('~/.dotfiles/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !ln -sfvn ~/.dotfiles/nvim ~/.config/nvim
    autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.viim
endif

" Required to start Plug:
call plug#begin(expand('~/.dotfiles/nvim/bundle'))

Plug 'tpope/vim-speeddating'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-markdown'
Plug 'sjl/gundo.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'eparreno/vim-l9'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/AutoComplPop'
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks

"" Color
Plug 'tomasr/molokai'
Plug 'endel/vim-github-colorscheme'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'https://github.com/juanedi/predawn.vim'

call plug#end()

" index do vim wiki
let g:vimwiki_list = [{'path': '~/.dotfiles/vim/wiki',
                     \ 'index': 'main', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0

" snippets settings
"let g:UltiSnips#ListSnippets="<C-tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

map ,u :UltiSnipsEdit<cr>
nmap ,v <esc>:e ~/.dotfiles/nvim/init.vim<cr>
nmap ,ww <esc> :VimwikiIndex<cr>

let g:UltiSnipsSnippetsDir = expand("~/.dotfiles/vim/snips/")
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]
map <leader>u :UltiSnipsEdit<cr>
" Snippets variables
let g:snips_author='Sergio Araujo'
let g:snips_site='http://vivaotux.blogspot.com'
let g:snips_email='<voyeg3r ✉ gmail.com>'
let g:snips_github='https://github.com/voyeg3r'
let g:snips_twitter='@voyeg3r'
let g:UltiSnipsEditSplit="horizontal"

if !exists("g:syntax_on")
    syntax enable
endif

map ,f <esc>:FZF<cr>
map ,d <esc>:FZF ~/.dotfiles<cr>
" :FZF ~/.dotfiles

set mouse=a
set path+=**
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline

set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\


" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme= 'gruvbox'

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Highlight redundant whitespace and tabs.
" This has the advantage of not highlighting each space you type at
" the end of the line, only when you open a file or leave insert
" mode. Very neat."
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"set background=light
if has('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme solarized
" source: http://tilvim.com/2013/07/31/swapping-bg.html
nmap <F8> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

nmap ,r :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

" this function gets last 20 cmds to new buffer
fun! s:RedirHistoryCommands()
    set paste
    redir @r
    history : -20,
    redir End
    new
    put r
    set nopaste
    :%s/^\s\+//g
    :g/^$/d
endfun
command! -nargs=0 GetHistory call s:RedirHistoryCommands()

" The function must be used in a piece of subtitles
" in order to clean it, join the lines and put the results
" on clipboard to be pasted on anki
fun! CleanSubtitles()
    let old_query = getreg('/')
    :g/^\(\s\+\)\=\d\+$/d
    :g/^\(\s\+\)\=\d\+.*-->\s\d[^,]*,\d\d\d$/d
    :%j
    :%s/,/, /g
    :%s,\s\+, ,g
    :%y+
    call setreg('/', old_query)
endfun
command! -nargs=0 GetSubs :call CleanSubtitles()

"dos2unix ^M
fun! Dos2unixFunction()
    call Preserve("%s/$//g")
    "call Preserve("%s/\\x0D$//")
    set ff=unix
    set bomb
    set encoding=utf-8
    set fileencoding=utf-8
endfun
com! Dos2Unix call Dos2unixFunction()

" one liner rename file
" source: http://stackoverflow.com/questions/1205286/renaming-the-current-file-in-vim
command! -nargs=1 Rename try | saveas <args> | call delete(expand('#')) | bd # | endtry

" remove consecutive blank lines
" see Preserve function definition
fun! DelBlankLines()
    keepjumps call Preserve("g/^\\n\\{2,}/d")
    "keepjumps call Preserve("g/^$/,/./-j")
endfun
command! -nargs=0 DelBlank :call DelBlankLines()

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
com! Cls :call CleanExtraSpaces()

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
com! Cls :call CleanExtraSpaces()

" Esta função insere um change log
" se nelas não houver "Last Change" ele passa batido
" ou seja não insere o cabeçalho
" usr_41.txt
fun! InsertChangeLog()
  let l:flag=0
  for i in range(1,5)
    if getline(i) !~ '.*Last Change.*'
      let l:flag = l:flag + 1
    endif
  endfor
  if l:flag >= 5
    normal(1G)
    call append(0, "Arquivo: <+Description+>")
    call append(1, "Created: " . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(2, "Last Change: " . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(3, "autor: <+digite seu nome+>")
    call append(4, "site: <+digite o endereço de seu site+>")
    call append(5, "twitter: <+your twitter here+>")
    call append(6, "email: <+seu email+>")
    normal gg
  endif
endfun

" Esta função Modifica o change log
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
" source: http://vim.wikia.com/wiki/Insert_current_date_or_time
function! LastModified()
    if &modified
        let save_cursor = getpos(".")
        let old_query = getreg('/')
            "1,10s/\v^.*Last Change:(\s+|\t+)\zs.*/\=strftime("%c")/e
            1,10s/\vLast Change:(\s+|\t+)\zs(.*)/\=strftime("%c")/e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endif
endfun
command! -nargs=0 LM :call LastModified()<cr>
autocmd BufWritePre * :call LastModified()
map <silent> <F9> <esc>:call LastModified()<cr>


" jump to next place holder
function! JumpToNextPlaceholder()
    let old_query = getreg('/')
    echo search("<+.\\++>")
    exec "norm! c/+>/e\<CR>"
    call setreg('/', old_query)
endfunction
nnoremap <special> <leader>j :keepjumps call JumpToNextPlaceholder()<CR>a
inoremap <special> <leader>j <ESC>:keepjumps call JumpToNextPlaceholder()<CR>a


fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
com! Cls :call CleanExtraSpaces()

au! BufwritePre * :call CleanExtraSpaces()

