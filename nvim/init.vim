" nvim init file ~/.config/nvim/init.vim
" Last Change: 2018 jan 10 18:51
" vim: ff=unix ai et ts=4
" Reference: http://sergioaraujo.pbworks.com/w/page/15864094/vimrc
"
"                 ( O O )
"  +-----------oOO--(_)--OOo--------------+
"  |                                      |
"  |    °v°    Sergio Luiz Araujo Silva   |
"  |   /(_)\  Linux User #423493          |
"  |    ^ ^    voyeg3r ✉ gmail.com        |
"  +--------------------------------------+

"As you type a substitution  the results will immediately be
"visible in the edit window. This feature is best highlighted
"in this video: http://www.youtube.com/watch?v=sA3z6gsqOuw
if has("nvim")
    set inccommand=nosplit
endif

set shada=!,'1000,<50,s10,h,%,'2000

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" source: https://www.vi-improved.org/vim-tips/
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

augroup highligh_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
augroup END

set guicursor+=n:blinkon1 " not blinking cursor in normal mode
"set guicursor+=i:blinkon1 " cursor blinkin in insert mode
set matchpairs=(:),{:},[:],<:>

" temporary solution for nvim cursor
"set guicursor=
set dictionary+=~/.dotfiles/nvim/words.txt     " C-x C-k C-n
set laststatus=2          " statusline specific
set lazyredraw            " speed up macros
set mouse=a               " enable mouse click
set mousehide             " hide mouse while typing
set path+=**              " gf to open files under cursor
set scrolloff=0           " keep 3 lines when scrolling
set sidescrolloff=0
set ai                    " set auto-indenting on for programming
set hidden                " Switch buffers without saving them
set showcmd               " display incomplete commands
set nobackup              " do not keep a backup file
set number                " show line numbers
set ruler                 " show the current row and column
set hlsearch              " highlight searches
set incsearch             " do incremental searching
set showmatch             " jump to matches when entering regexp
set ignorecase            " ignore case when searching
set infercase             " case inferred by default
set smartcase             " no ignorecase if Uppercase char present
set visualbell t_vb=      " turn off error beep/flash
set novisualbell          " turn off visual bell
set tabstop=4             " Number of spaces that a <Tab> in the file counts for
set softtabstop=4         " number of spaces in tab when editing
set formatoptions+=j      " Delete comment characters when joining lines
set title                 " shows filename at the top
set expandtab             " Converts tab into spaces
set shiftwidth=4
set shiftround            "when at 3 spaces, and I hit > go to 4, not 5
set backspace=indent,eol,start  " make that backspace key work the way it should
set t_RV= " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set lcs+=space:·,nbsp:•
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildignore+=*.so,*.pdf,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmenu
set wildmode=longest:full,list:full
set whichwrap +=<,>
set completeopt=longest,menuone
set nopaste
set pastetoggle=<F2>
set linebreak                  " Keep whole words during wrapping
set noshowmode
set autoread
set noerrorbells visualbell t_vb=
set clipboard=unnamed,unnamedplus

"You can get case-insensitivity for the filename completion in Vim with the
"following. I suggest wrapping it in a conditional as below, since it’s a
"reasonably new option:
if exists("&wildignorecase")
    set wildignorecase
endif

if ! isdirectory($HOME . '/.vimundodir')
    :silent !mkdir -p ${HOME}/.vimundodir > /dev/null 2>&1
endif
set undodir=~/.vimundodir
set undofile " Maintain undo history between sessions

let vimplug_exists=expand(glob('~/.config/nvim/autoload/plug.vim'))

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand(glob('~/.config/nvim/plugged')))

"Plug 'mhinz/vim-startify'
Plug 'henrik/vim-indexed-search'
Plug 'rking/ag.vim'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-abolish'                  " Advanced regex Substitution
Plug 'tpope/vim-characterize'
Plug 'godlygeek/tabular'
Plug 'coderifous/textobj-word-column.vim'
Plug 'tommcdo/vim-exchange'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'nelstrom/vim-markdown-folding'
"Plug 'haya14busa/incsearch.vim'
"Plug 'timakro/vim-searchant'
"Plug 'inside/vim-search-pulse'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/VisIncr'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plug 'vimwiki/vimwiki'
Plug 'sjl/gundo.vim'
Plug 'chrisbra/NrrwRgn'
"Plug 'tpope/vim-speeddating'
"Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/vim-closer'
"Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
"Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Color
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'endel/vim-github-colorscheme'
Plug 'tpope/vim-vividchalk'
Plug 'noahfrederick/vim-hemisu'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/tomorrow-theme'

" statusline
Plug 'itchyny/lightline.vim'

call plug#end()

" SOME DEOPLETE CONFIGURATIONS
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#file#enable_buffer_path = 1
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noinsert

" Required:
filetype plugin indent on

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

syntax on

let no_buffers_menu=1

" netrw config
let g:netrw_winsize = 25

"colorscheme molokai
set t_Co=256   " This is may or may not needed.

" set backgroun light until 17h
" https://stackoverflow.com/a/7589970/2571881
if strftime("%H") < 17
  set background=light
else
  set background=dark
endif
colorscheme PaperColor
"colorscheme hemisu

hi Search ctermbg=Yellow
hi Search ctermfg=Black

" When double click a word vim will hightlight all other ocurences
" see CountWordFunction()
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>:CountWord<cr>
nnoremap <leader>* :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

  " jump to lines with <count><Space>
nmap <expr> <Space> v:count ? "gg" : "<Space>"

" source: http://tilvim.com/2013/07/31/swapping-bg.html
 nmap <F7> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :res +5<CR>
nnoremap <C-Down> :res -5<CR>

" jump to next buffer
nnoremap <M-right> :bn<cr>
nnoremap <M-left> :bp<cr>

" close the buffer
nnoremap <leader>db :Bdelete!<cr>

" list buffers and jump to a chosen one
"nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>b :ls<cr>:b<space>
" set wildcharm=<C-z>
" :buffer <c-z> <shift-tab>
nnoremap <leader>B :buffer <C-z><S-Tab>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

" sometimes you need to know how many opened buffers you have
" source: https://superuser.com/a/1221514/45032
fun! CountBuffers() abort
    "let l:total = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:total = len(getbufinfo({'buflisted':1}))
    echom "you have " . l:total . " opened buffers!"
endfun
command! -nargs=0 Nbufs :call CountBuffers()

" buffer cleanup - delete every buffer except the one open
function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
|   endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endfunction
" close all buffers
command! Ball :silent call Bdeleteonly()

" format paragraph keeping cursor position
nnoremap <F8> gwap

" Search word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<left><left>

" Scroll split window
nnoremap <C-M-k> <c-w>w<c-y><c-w>w
nnoremap <C-M-j> <c-w>w<c-e><c-w>w

nnoremap <M-=> <C-w>+
nnoremap <M--> <C-w>-

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

let mapleader=','

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    "set guifont=Menlo:h12
	"set guifont=Fira\ Code:h12
	set guifont=Monoid:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1
  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

" pairs
for mapmode in [ "o", "x" ]
    for delimiter in [ "{}", "()", "[]", "<>" ]
        let opening = delimiter[0]
        let closing = delimiter[1]
        for modifier in [ "i", "a" ]
            for trigger in [ opening, closing ]
                execute mapmode . "noremap <silent> " . modifier . "n" . trigger . " :<C-U>normal! f" . opening . "v" . modifier . closing . "<CR>"
                execute mapmode . "noremap <silent> " . modifier . "l" . trigger . " :<C-U>normal! F" . closing . "v" . modifier . opening . "<CR>"
            endfor
        endfor
    endfor

    " single (text objects like da. delete one dot)
    for delimiter in [ "_", ".", ":", ",", ";", "<bar>", "/", "<bslash>", "*" ]
        execute mapmode . "noremap <silent> i"  . delimiter . " :<C-U>normal! t" . delimiter .  "vT" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> a"  . delimiter . " :<C-U>normal! f" . delimiter .  "vT" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> in" . delimiter . " :<C-U>normal! f" . delimiter . "lvt" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> an" . delimiter . " :<C-U>normal! f" . delimiter . "lvf" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> il" . delimiter . " :<C-U>normal! F" . delimiter . "hvT" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> al" . delimiter . " :<C-U>normal! F" . delimiter .  "vT" . delimiter . "<CR>"
    endfor

    " double (text objects like dan" delete both quotes)
    " doesn't handle one surrounding whitespace like da" does
    for delimiter in [ "\"", "'", "`" ]
        execute mapmode . "noremap <silent> in" . delimiter . " :<C-U>normal! f" . delimiter . "lvt" . delimiter . "<CR>" | " same as above
        execute mapmode . "noremap <silent> an" . delimiter . " :<C-U>normal! f" . delimiter .  "vf" . delimiter . "<CR>" | " same as above
        execute mapmode . "noremap <silent> il" . delimiter . " :<C-U>normal! F" . delimiter . "hvT" . delimiter . "<CR>"
        execute mapmode . "noremap <silent> al" . delimiter . " :<C-U>normal! F" . delimiter .  "vF" . delimiter . "<CR>"
    endfor
endfor

command! -nargs=0 Reindent :call Preserve('exec "normal! gg=G"')

command! MakeTags !ctags -R .

" create a scratch window
command! Scratch new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
cab SC Scratch

"  when searching next patter put it in the middle of screen
nnoremap n nzz:ShowSearchIndex<CR>
nnoremap N Nzz:ShowSearchIndex<CR>
"nnoremap * *zz
nnoremap # #zz:ShowSearchIndex<CR>
"nnoremap g* gtzz
nnoremap g# g#zz:ShowSearchIndex<CR>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" select last paste in visual mode
" With <leader>p we easily select the pasted text and we fix the indentation with  <  or >.
nnoremap <expr> <leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'
noremap gV `[v`]

" Last inserted text
nnoremap g. :normal! `[v`]<cr><left>

" It adds motions like 25j and 30k to the jump list, so you can cycle
" through them with control-o and control-i.
" source: https://www.vi-improved.org/vim-tips/
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

" https://sanctum.geek.nz/arabesque/vim-command-typos/
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"*****************************************************************************
"" Functions
"*****************************************************************************

" https://vi.stackexchange.com/a/440/7339
" Like gJ, but always remove spaces
fun! JoinSpaceless() abort
    execute 'normal gJ'
    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun
" Map it to a key
nnoremap <leader>J :call JoinSpaceless()<CR>

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

" join lines keeping cursor position
nnoremap <leader>j :join<cr>
nnoremap <leader>gj :join!<cr>

" to insert this result: --> :put =Randnum(1000)
function! Randnumber(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction

fun! CleanFlaschards() abort
    %w! output.csv-backup
    let @a = 'gg0v$hdJ}}{jA[sound:"];gJA;MairoVergaraVdGopgg'
	"let @b = 'gg0v$hd)A[sound:"]A;gj:g/^$/d:w'
    let @b = 'gg0v$hd)A[sound:"A;gJA;MairoVergara:g/^$/d:w'
	%s,\v\<(\/)?(strong|em|br|a href[^>]*|((span|p|iframe)[^>]*))(\/)?\>|(\([^)]*\)),,g
	%s,\v\<(\/)?\zsu\ze\>,b,g
	%s,\v\s+$,,g
	%s,;,:,ge
	%s,\v\W?\<b\>(\W\<\/b\>)?$,,g
	%s,\v(^)?((\<b\>)?\<br\>?)$,,g
	%s,\v(^\<\/p\>?)|(\<\/p\>?)|(\<b\>\<br\>?$),,g
	g/^\W\+$/d
	normal gg
	silent normal! /v((vamos (então )?aos |(ver|veja|seguem) (os|alguns)? )?exemplos( abaixo)?)|anki/dipgg
	silent normal! /\v(no post de hoje)/dipgg
	normal gg
	g/\v^\d+\W?(–|-)/d
	normal gg
	g/<b>[^<]*$/normal $gJf>agg
	silent normal! /<u>\|<b>/{kdgg
	normal gg
	silent normal! /:$/dipgg
	normal /CLIQUE/{kdG
	"0r audios.txt
	0r !ls *.mp3 | sort -n -k1
	g/\.mp3/s/^\d\+-//g
    g/repetição espaçada/normal! dap
	"g/.*mp3/s/http.*\/\d\+-//g
	g/.*mp3/s,%E2%80%99\|%E2%80%93\|%E2%80%98\|%E2%80%9,_,g
	g/.*\.mp3/s,%E2%80%9C\|%E2%80%9D,,g
	%s,\(\.\)\(<\/b>\)$,\2\1,g
	normal gg
	silent normal! /^<\/b>$/kJD
	%s/\v(!|.|\?)  /\1 /ge
	DelBlank
	normal gg
	normal vipo
	let selectionsize = line("'>") - line("'<") + 1
	echom "Execute a macro 'a' " . (selectionsize - 1) . " vezes"
endfun
command! -nargs=0 CFlashcards :silent call CleanFlaschards()

" This function requires you select the numbers
" source: https://vi.stackexchange.com/a/4699/7339
fun! SumVis() abort
    try
        let l:a_save = @a
        norm! gv"ay
        let @a = substitute(@a,'[^0-9. ]','+','g')
        exec "norm! '>o"
        exec "norm! iTotal: \<c-r>=\<c-r>a\<cr>"
     finally
        let @a = l:a_save
     endtry
endfun
vnoremap <C-s> :<C-u>call SumVis()<CR>

" search visually selected text
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

" Get hid of E488: https://vi.stackexchange.com/questions/4689/
" Remove the trailing <cr> That is only needed for mappings, but not for commands.
fun! CountWordFunction()
    try
        let l:win_view = winsaveview()
        let l:old_query = getreg('/')
        let var = expand("<cword>")
        exec "%s/" . var . "//gn"
    finally
        call winrestview(l:win_view)
        call setreg('/', l:old_query)
    endtry
endfun
command! -nargs=0 CountWord :call CountWordFunction()

" map to count word under cursor
" https://stackoverflow.com/a/11492536/2571881
" nnoremap <f3> :execute ":%s@\\<" . expand("<cword>") . "\\>\@&@gn"<CR>
" see function CountWordFunction
nnoremap <f3> :CountWord<CR>

" use primary selection with mouse
vnoremap <LeftRelease> "*ygv

" Search selected text
vnoremap // y/<C-R>"<CR>

" Insert lines below and above (with count)
" nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" https://vi.stackexchange.com/a/7278/7339
nnoremap <leader>o @="m`o\eg``"<cr>
nnoremap <leader>O @="m`O\eg``"<cr>

" Autocmd Rules **********************************

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrcFunction')
    fun! ReloadVimrcFunction()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrcFunction()
command! -nargs=0 ReloadVimrc call ReloadVimrcFunction()

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" python
augroup python
    au FileType python set keywordprg=pydoc
    au! BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    au! BufRead,Bufnewfile *.py im :<CR> :<CR><TAB>
    au! BufWritePre *.py,*.js :call <SID>StripTrailingWhitespace()
    au! BufNewFile *.py 0r ~/.vim/skel/template.py
    au BufNewFile *.py call Preserve('1,5s/Created:\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.py :%s/File:\s\+\zs.*/\=expand("%:t")
    au! BufWritePost *.py :silent !chmod a+x <afile>
    autocmd FileType python set textwidth=79
    autocmd FileType python filetype indent on
    let python_highlight_all=1
    let python_highlight_builtins=0
    let python_highlight_builtins=1
    let python_highlight_exceptions=1
    let python_highlight_numbers=1
    let python_highlight_space_errors=1
	autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType python xnoremap <buffer> <leader>c :normal I#<CR>
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"augroup markdown
"    autocmd FileType markdown,vimwiki setlocal textwidth=78 formatprg=par\ -w78
"augroup END

" set cursor line in normal mode
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

augroup sh
    au BufNewFile *.sh 0r ~/.vim/skel/template.sh
    au BufNewFile *.sh call Preserve('1,5s/\(Last Change\|Created\):\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.sh :%s/File:\s\+\zs.*/\=expand("%:t")
    au BufWritePost *.sh :silent !chmod a+x <afile>
augroup end

augroup zsh
    au BufNewFile *.zsh 0r ~/.vim/skel/template.zsh
    au BufNewFile *.zsh call Preserve('1,5s/Created:\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.zsh :%s/File:\s\+\zs.*/\=expand("%:t")
    au BufWritePost *.zsh :silent !chmod a+x <afile>
augroup end

augroup html
    " au! <--> Remove all html autocommands
    au!
    au BufNewFile,BufRead *.html,*.shtml,*.htm set ft=html
    "au BufNewFile,BufRead,BufEnter  *.html,*.shtml,*.htm so ~/.vim/skel/skel.html
    au BufNewFile *.html 0r ~/.vim/skel/template.html | let IndentStyle = "html"
    "au BufNewFile *.html,*.shtml,*.htm /body/+
    au BufNewFile,BufRead *.html,*.shtml,*.htm set noautoindent
    au BufNewFile,BufRead *.html,*.shtml,*.htm set nolist
    "au BufNewFile,BufRead *.html,*.shtml,*.htm call LastModified()
    " needed one line with 'Created:' in firsts 5 lines
    "au Bufnewfile,BufRead *.html,*.shtml,*.htm 1,5s/\s*Created:\s*\zs.*/\="" . strftime("%Y %b %d %X")/ge
    au BufNewFile,BufRead *.html,*.shtml,*.htm call Preserve('1,5s/\(Last Change\|Created\):\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.html :%s/File:\s\+\zs.*/\=expand("%:t")
augroup end

augroup css
    au Bufnewfile,BufRead *.css set ft=css
    au BufNewFile *.css 0r ~/.vim/skel/template.css
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    "au BufNewFile *.css exe "1," . 10 . "s/Created:.*/Created: " .strftime("%d-%m-%Y")
    au BufNewFile *.css call Preserve('1,5s/\(Last Change\|Created\):\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.css :%s/File:\s\+\zs.*/\=expand("%:t")
    au Bufnewfile *css,*scss setl iskeyword+=-
augroup end

augroup tex
    au Bufnewfile,BufRead *.tex set ft=tex
    au BufNewFile *.tex 0r ~/.vim/skel/template.tex
    au BufNewFile *.tex call Preserve('1,5s/Created:\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.tex :%s/File:\s\+\zs.*/\=expand("%:t")
    vnoremap e <tab>em<tab>
    vnoremap ' <tab>'<tab>
    iab latex \LaTeX\
    iab tex \Tex\
    normal gg
augroup end

"" Git
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Change in next bracket
nnoremap cinb cib
nnoremap cinB ciB

"" fzf.vim
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>m :History<cr>
nnoremap <silent> <leader>e :FZF -m ~/.dotfiles<CR>

"command! FZFMru call fzf#run({
"\  'source':  v:oldfiles,
"\  'sink':    'e',
"\  'options': '-m -x +s',
"\  'down':    '40%'})
"nnoremap ,m :FZFMru<cr>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<C-Space>"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv

" Move lines in all modes with Ctrl-k Ctrl-j
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>

" delete current line on insert mode
inoremap  <leader>k <C-o>dd

" vim-airline
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

" This function allows you to open the last edited file
" in order to open the last file from the SHELL
" on nvim you have to create an alias
" alias lnvim="nvim -c':e#<1'"
" Reference: https://www.reddit.com/r/vim/comments/fx6l5/
fun! MruFile() abort
    let filename = get(v:oldfiles, 0, '')
    if filename != ''
        exe "edit " . filename
    endif
endfun
nnoremap <leader>l :call MruFile()<cr>
command! -nargs=0 Mrf call MruFile()

" Hey brazilian portuguese users! what you are waiting for?
nnoremap ç :

" fzf configuration
" <C-p> to search files
nnoremap <silent> <c-p> :FZF -m ~/.dotfiles<cr>
" end - fzf configuration

nnoremap ,ag :Ag<SPACE>

" index do vim wiki
let g:vimwiki_list = [{'path': '~/.dotfiles/vim/wiki',
                     \ 'index': 'main', 'syntax': 'markdown', 'ext': '.md'}]
nnoremap == <Plug>VimwikiAddHeaderLevel
nnoremap -- <Plug>VimwikiRemoveHeaderLevel
"*:VimwikiSearch* /pattern/
"*:VWS* /pattern/
"    Search for /pattern/ in all files of current wiki.
"    To display all matches use |:lopen| command.
"    To display next match use |:lnext| command.
"    To display previous match use |:lprevious| command.
let g:vimwiki_table_mappings = 0

" Highlight redundant whitespace and tabs.
" This has the advantage of not highlighting each space you type at
" the end of the line, only when you open a file or leave insert
" mode. Very neat."

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call StripTrailingWhitespace()

" source: https://www.vi-improved.org/recommendations/
function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        call Preserve('%s/\s\+$//e')
    endif
endfunction
com! Cls :call StripTrailingWhitespace()
au! BufwritePre * :call StripTrailingWhitespace()

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Esta função insere um change log
" se nelas não houver "Last Change" ele passa batido
" ou seja não insere o cabeçalho
" usr_41.txt
fun! InsertChangeLog() abort
    let l:flag=0
    for i in range(1,5)
        if getline(i) !~ '.*Last Change.*'
            let l:flag = l:flag + 1
        endif
    endfor
    if l:flag >= 5
        normal(1G)
        call append(0, "Arquivo: <+Description+>")
        call append(1, "Created: " . strftime("%Y %B %d hs %H:%M"))
        call append(2, "Last Change: " . strftime("%Y %B %d hs %H:%M"))
        call append(3, "autor: <+digite seu nome+>")
        call append(4, "site: <+digite o endereço de seu site+>")
        call append(5, "twitter: <+your twitter here+>")
        call append(6, "email: <+seu email+>")
        normal gg
    endif
endfun

fun! ChangeHeader() abort
    if line('$')>=5
        call Preserve('1,5s/Last \(Change\|Modified\):\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
		normal <C-o>
    endif
endfun
command! -nargs=0 CH :call ChangeHeader()
au! BufReadPost * :silent call ChangeHeader()

" jump to next place holder
function! JumpToNextPlaceholder() abort
    let old_query = getreg('/')
    echo search("<+.\\++>")
    exec "norm! c/+>/e\<CR>"
    call setreg('/', old_query)
endfunction
nnoremap <special> <leader>j :keepjumps call JumpToNextPlaceholder()<CR>a
inoremap <special> <leader>j <ESC>:keepjumps call JumpToNextPlaceholder()<CR>a

" map Ctrl-k in inserto mode to delete til the end of line
" inoremap <C-k> <C-o>d$

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align() abort
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" The function must be used in a piece of subtitles
" in order to clean it, join the lines and put the results
" on clipboard to be pasted on anki
fun! CleanSubtitles() abort
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

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ********************************************************
fun! SearchHighlight() abort
    silent! call matchdelete(b:ring)
    let b:ring = matchadd('ErrorMsg', '\c\%#' . @/, 101)
endfun

" dos2unix ^M
fun! Dos2unixFunction() abort
    "call Preserve('%s/$//ge')
    call Preserve("%s/\x0D$//e")
    set ff=unix
    set bomb
    set encoding=utf-8
    set fileencoding=utf-8
endfun
com! Dos2Unix :call Dos2unixFunction()

" one liner rename file
" source: http://stackoverflow.com/questions/1205286/renaming-the-current-file-in-vim
command! -nargs=1 Rename try | saveas <args> | call delete(expand('#')) | bd # | endtry

" Utility function that save last search and cursor position
" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
" video from vimcasts.org: http://vimcasts.org/episodes/tidying-whitespace
if !exists('*Preserve')
    function! Preserve(command)
        try
            " Preparation: save last search, and cursor position.
            let l:win_view = winsaveview()
            let l:old_query = getreg('/')
            silent! execute 'keepjumps' . a:command
            " Clean up: restore previous search history, and cursor position
        finally
            call winrestview(l:win_view)
            call setreg('/', l:old_query)
        endtry
    endfunction
endif

" remove consecutive blank lines
" see Preserve function definition
fun! DelBlankLines() abort
    if !&binary && &filetype != 'diff'
        call Preserve('%s/\s\+$//e')
        call Preserve('%s/^\n\{2,}/\r/ge')
    endif
endfun
command! -nargs=0 DelBlank :call DelBlankLines()
" delete sucessive blank lines and trailing spces
nnoremap <special> <leader>d :call DelBlankLines()<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
command! SaveAsRoot w !sudo tee %
cnoreabbrev ww SaveAsRoot
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Insert current line at command line
cnoremap <C-r><C-l> <C-r>=getline('.')<CR>
nnoremap <leader>c :<C-r>=getline('.')<CR>

" to reselect use gv in normal mode
nnoremap <F23> <ESC>:set hls! hls?<cr>
inoremap <F23> <C-o>:set hls! hls?<cr>
vnoremap <F23> <ESC>:set hls! hls?<cr> <bar> gv

" alternate between relative number, number and no number
set nu rnu
"nmap <F2> :set nu rnu<cr>
nnoremap <F2> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

" noremap <silent> <leader>v :e ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>v :e $MYVIMRC<cr>

" Run current line as a vim command
" https://stackoverflow.com/a/19884862/2571881
nnoremap <F6> :exec getline('.')

" mapeamento para abrir e fechar folders em modo normal usando
" a barra de espaços -- zR abre todos os folders
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap Q :normal n.<CR>

" snippets settings
"let g:UltiSnips#ListSnippets="<C-tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

if exists(":python3")
   let g:_uspy=":python3"
   let g:ultisnipsusepythonversion = 3
endif

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

iab fname <C-R>=expand("%:t")<CR>
iab idate <C-R>=strftime("%c")<CR>
iab hdate <C-R>=strftime("%Y %B %d")<CR>
iab -> →
iab mymail <voyeg3r ✉ gmail.com>
iab slas Sérgio Luiz Araújo Silva
iab tuiter http://www.twitter.com/voyeg3r
iab vivaotux http://vivaotux.blogspot.com
cab ag Ag
