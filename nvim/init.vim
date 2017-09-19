" nvim init file ~/.config/nvim/init.vim
" Last Change: ter 19 set 2017 06:24:14 -03
"
"                 ( O O )
"  +===========oOO==(_)==OOo==============+
"  |                                      |
"  |    °v°    Sergio Luiz Araujo Silva   |
"  |   /(_)\  Linux User #423493          |
"  |    ^ ^    voyeg3r ✉ gmail.com        |
"  +======================================+

set nocompatible
set path+=**

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

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

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"Plug 'mhinz/vim-startify'
Plug 'coderifous/textobj-word-column.vim'
Plug 'tommcdo/vim-exchange'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-markdown-folding'
"Plug 'haya14busa/incsearch.vim'
"Plug 'timakro/vim-searchant'
"Plug 'inside/vim-search-pulse'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/AutoComplPop'
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plug 'vimwiki/vimwiki'
Plug 'sjl/gundo.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-speeddating'
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
Plug 'bronson/vim-trailing-whitespace'
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

"" Color
Plug 'tomasr/molokai'
Plug 'endel/vim-github-colorscheme'
Plug 'tpope/vim-vividchalk'
Plug 'noahfrederick/vim-hemisu'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/tomorrow-theme'

call plug#end()

" Required:
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set backspace=indent,eol,start
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

syntax on
set ruler
set number relativenumber

let no_buffers_menu=1

colorscheme molokai
set background=dark

" source: http://tilvim.com/2013/07/31/swapping-bg.html
 nmap <F7> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
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

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

nnoremap ' `
nnoremap ç :
nnoremap K :help <C-r><C-w><CR>

command! -nargs=0 Reindent :call Preserve('exec "normal! gg=G"')

"  when searching next patter put it in the middle of screen
nnoremap n nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
noremap gV `[v`]

" move vertically by visual line
" source: https://stackoverflow.com/a/21000307/2571881
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"  vim-airline
"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=66
    set formatoptions+=t
  endfunction
endif

" This function requires you select the numbers
" source: https://vi.stackexchange.com/a/4699/7339
fun! SumVis()
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
vnoremap <C-s> :<C-u>call SumVis()<cr>

" sometimes you need to know how many opened buffers you have
" source: https://superuser.com/a/1221514/45032
fun! CountBuffers()
    "let l:total = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:total = len(getbufinfo({'buflisted':1}))
    echom "you have " . l:total . " opened buffers!"
endfun
command! -nargs=0 Nbufs :call CountBuffers()

" Insert lines below and above (with count)
" nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" https://vi.stackexchange.com/a/7278/7339
nnoremap <c-n> @="m`o\eg``"<cr>
nnoremap <c-p> @="m`O\eg``"<cr>

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
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

augroup markdown
    autocmd FileType markdown,vimwiki setlocal textwidth=78 formatprg=par\ -w78
augroup END

set autoread

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('par')
    set formatprg=par\ -w60rj
endif

nnoremap <silent> <leader>b :Buffers<CR>
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
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" vim-airline
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"if !exists('g:airline_powerline_fonts')
"  let g:airline#extensions#tabline#left_sep = ' '
"  let g:airline#extensions#tabline#left_alt_sep = '|'
"  let g:airline_left_sep          = '▶'
"  let g:airline_left_alt_sep      = '»'
"  let g:airline_right_sep         = '◀'
"  let g:airline_right_alt_sep     = '«'
"  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
"  let g:airline#extensions#readonly#symbol   = '⊘'
"  let g:airline#extensions#linecolumn#prefix = '¶'
"  let g:airline#extensions#paste#symbol      = 'ρ'
"  let g:airline_symbols.linenr    = '␊'
"  let g:airline_symbols.branch    = '⎇'
"  let g:airline_symbols.paste     = 'ρ'
"  let g:airline_symbols.paste     = 'Þ'
"  let g:airline_symbols.paste     = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"else
"  let g:airline#extensions#tabline#left_sep = ''
"  let g:airline#extensions#tabline#left_alt_sep = ''
"
"  " powerline symbols
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = ''
"endif

" This function allows you to open the last edited file
" in order to open the last file from the SHELL
" on nvim you have to create an alias
" alias lnvim="nvim -c':e#<1'"
" Reference: https://www.reddit.com/r/vim/comments/fx6l5/
fun! MruFile()
    let filename = get(v:oldfiles, 0, '')
    if filename != ''
        exe "edit " . filename
    endif
endfun
nnoremap ,l :call MruFile()<cr>
command! -nargs=0 Mru call MruFile()

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
" Reference: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * redraw!

" When double click a word vim will hightlight all other ocurences
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
nnoremap <leader>* :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline

fun! ChangeHeader()
    if line('$')>=5
        call Preserve('1,5s/Last Change: \zs.*/\=strftime("%c")/e')
    endif
endfun
command! -nargs=0 CH :call ChangeHeader()
au! BufReadPost * :silent call ChangeHeader()

" jump to next place holder
function! JumpToNextPlaceholder()
    let old_query = getreg('/')
    echo search("<+.\\++>")
    exec "norm! c/+>/e\<CR>"
    call setreg('/', old_query)
endfunction
nnoremap <special> <leader>j :keepjumps call JumpToNextPlaceholder()<CR>a
inoremap <special> <leader>j <ESC>:keepjumps call JumpToNextPlaceholder()<CR>a

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

fun! CleanExtraSpaces()
    call Preserve('%s/\s\+$//ge')
endfun
com! Cls :call CleanExtraSpaces()
au! BufwritePre * :call CleanExtraSpaces()

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ********************************************************
fun! SearchHighlight()
    silent! call matchdelete(b:ring)
    let b:ring = matchadd('ErrorMsg', '\c\%#' . @/, 101)
endfun

" dos2unix ^M
fun! Dos2unixFunction()
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
        " Preparation: save last search, and cursor position.
        let l:win_view = winsaveview()
        let l:old_query = getreg('/')
        silent! execute 'keepjumps' . a:command
        " Clean up: restore previous search history, and cursor position
        call winrestview(l:win_view)
        call setreg('/', l:old_query)
    endfunction
endif

" remove consecutive blank lines
" see Preserve function definition
fun! DelBlankLines()
    call Preserve('%s/^\n\{2,}/\r/ge')
endfun
command! -nargs=0 DelBlank :call DelBlankLines()

" delete sucessive blank lines and trailing spces
nnoremap <special> <leader>d :call DelBlankLines()<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
command! SaveAsRoot w !sudo tee %
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" to reselect use gv in normal mode
nnoremap <F23> <ESC>:set hls!<cr>
inoremap <F23> <C-o>:set hls!<cr>
vnoremap <F23> <ESC>:set hls!<cr> <bar> gv

noremap <silent> <leader>v :e ~/.config/nvim/init.vim<cr>

" mapeamento para abrir e fechar folders em modo normal usando
" a barra de espaços -- zR abre todos os folders
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

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

