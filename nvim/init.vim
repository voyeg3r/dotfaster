" nvim init file ~/.config/nvim/init.vim
" Last Change: qui 02 nov 2017 12:57:02 -03
"
"                 ( O O )
"  +===========oOO==(_)==OOo==============+
"  |                                      |
"  |    °v°    Sergio Luiz Araujo Silva   |
"  |   /(_)\  Linux User #423493          |
"  |    ^ ^    voyeg3r ✉ gmail.com        |
"  +======================================+

"As you type a substitution  the results will immediately be
"visible in the edit window. This feature is best highlighted
"in this video: http://www.youtube.com/watch?v=sA3z6gsqOuw
if has("nvim")
    set inccommand=nosplit
endif

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set cursorline
set guicursor+=n:blinkon0 " not blinking cursor in normal mode
"set guicursor+=i:blinkon1 " cursor blinkin in insert mode
set laststatus=2          " statusline specific
set mouse=a               " enable mouse click
set path+=**              " gf to open files under cursor
set nocompatible          " use vim defaults
set scrolloff=3           " keep 3 lines when scrolling
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
set smartcase             " no ignorecase if Uppercase char present
set visualbell t_vb=      " turn off error beep/flash
set novisualbell          " turn off visual bell
set tabstop=4             " Number of spaces that a <Tab> in the file counts for
set backspace=indent,eol,start  " make that backspace key work the way it should
set t_RV= " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set lcs+=space:·
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildignore+=*.so,*.pdf,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmenu
set nopaste
set pastetoggle=<F2>
set noshowmode
set undofile " Maintain undo history between sessions
set undodir=~/.vimundodir
set autoread
set noerrorbells visualbell t_vb=
set clipboard=unnamed,unnamedplus

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

call plug#begin(expand('~/.config/nvim/plugged'))

"Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'w0rp/ale'                           " Asyncronous lint engine
Plug 'tpope/vim-abolish'                  " Advanced regex Substitution
"Plug 'bitc/vim-bad-whitespace'            " Find bad whitespace
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
Plug 'vim-scripts/AutoComplPop'
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

" Required:
filetype plugin indent on

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

syntax on

let no_buffers_menu=1

"colorscheme molokai
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor

" source: http://tilvim.com/2013/07/31/swapping-bg.html
 nmap <F7> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" format paragraph keeping cursor position
nnoremap <F8> :call Preserve("normal gqap")<CR>

"move lines in normal mode
nnoremap <C-j> :m+<CR>
nnoremap <C-k> :m-2<CR>

" Search word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<left><left>

" Scroll split window
nnoremap <M-j> <c-w>w<c-e><c-w>w
nnoremap <M-k> <c-w>w<c-y><c-w>w

nnoremap <M-=> <C-w>+
nnoremap <M--> <C-w>-

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

let mapleader=','

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

nnoremap ' `
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
" it makes j and k work with visual lines unless you put counter before them
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

" to insert this result: --> :put =Randnum(1000)
function! Randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction

fun! CleanFlaschards()
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

" " source: http://ddrscott.github.io/blog/2016/vim-toggle-movement/
" function! ToggleHomeEnd()
"   let pos = getpos('.')
"   execute "normal! 0"
"   if pos == getpos('.')
"     execute "normal! $"
"   endif
" endfunction
" nnoremap 0 :call ToggleHomeEnd()<CR>

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
vnoremap <C-s> :<C-u>call SumVis()<CR>

" search visually selected text
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'

fun! CountWord()
        let l:win_view = winsaveview()
        let l:old_query = getreg('/')
		let var = expand("<cword>")
		exec "%s/" . var . "//gn"
        call winrestview(l:win_view)
        call setreg('/', l:old_query)
endfun
nnoremap ,c :call CountWord()<CR>

" use primary selection with mouse
vnoremap <LeftRelease> "*ygv

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
nnoremap <leader>o @="m`o\eg``"<cr>
nnoremap <leader>O @="m`O\eg``"<cr>

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

" set cursor line in normal mode
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

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
command! -nargs=0 Mrf call MruFile()

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

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" When double click a word vim will hightlight all other ocurences
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
nnoremap <leader>* :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline


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
    call append(1, "Created: " . strftime("%Y %B %d hs %H:%M"))
    call append(2, "Last Change: " . strftime("%Y %B %d hs %H:%M"))
    call append(3, "autor: <+digite seu nome+>")
    call append(4, "site: <+digite o endereço de seu site+>")
    call append(5, "twitter: <+your twitter here+>")
    call append(6, "email: <+seu email+>")
    normal gg
  endif
endfun

fun! ChangeHeader()
    if line('$')>=5
        call Preserve('1,5s/Last \(Change\|Modified\): \zs.*/\=strftime("%c")/ei')
		normal <C-o>
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

" map Ctrl-k in inserto mode to delete til the end of line
inoremap <C-k> <C-o>d$

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
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

