"   nvim file: ~/.config/nvim/init.vim
" Last Change: 2018 abr 17 11:49
"         vim: ff=unix ai et ts=4
"      Author: Sérgio Luiz Araújo Silva
"   Reference: http://sergioaraujo.pbworks.com/w/page/15864094/vimrc
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
" Required:
filetype plugin indent on
let mapleader = ','
set shada=!,'1000,<50,s10,h,%,'2000
set nospell
"set spelllang=en,pt
"set complete+=kspell
"set sps=8              " Quantidade de sugestões do spell
" i_Ctrl-g_u allows us to have a better undo
inoremap <C-s> <c-g>u<Esc>[s1z=gi<c-g>u
nnoremap <C-s> [s1z=<C-o>
nnoremap <Leader>s ]s1z=<C-o>
nnoremap <Leader>g ]szg<C-o>
" See more about <C-x>s
" Below mappings allows you to toggle spelling
nnoremap <F7> :setlocal spell!<CR>
inoremap <F7> <C-o>:setlocal spell!<CR>
" avoid clipboard hacking security issue
" http://thejh.net/misc/website-terminal-copy-paste
inoremap <C-R>+ <C-R><C-R>+
" Auto reindent pasted text (from hacking vim p.138)
" nnoremap p p=`]
" cool
nnoremap c* *<C-o>cgn
nnoremap c# #<C-o>cgn
fun! CopyBufferToClipboard()
    %y+
endfun
nnoremap <Leader>y :call CopyBufferToClipboard()<CR>
command! -nargs=0 CopyFile :call CopyBufferToClipboard()
command! CloneBuffer new | 0put =getbufline('#',1,'$')
" Reverse lines - it accepts ranges Example →  :.,.+5Reverse
command! -bar -range=% Reverse <line1>,<line2>global/^/m<line1>-1
command! ReverseLine call setline('.', join(reverse(split(getline('.')))))
command! -bar -range Mirror <line1>,<line2>call setline('.', join(reverse(split(getline('.'), '\zs')), ''))
vnoremap <Leader>r c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
"fun! RevertSelectedString()
"    try
"        let l:old_plus = getreg('+')
"        normal gv"+y
"        let @+=join(reverse(split(string(@+), '.\zs')), '')
"        let @+=substitute(@+, "'", "", "g")
"        normal gv"+p
"    finally
"        call setreg('+', l:old_plus)
"    endtry
"endfun
"vnoremap <Leader>r :<C-u>call RevertSelectedString()<CR>
function! ReverseSelectedWords()
    try
        let l:old_plus = getreg('+')
        normal gv"+y
        let @+ = join(reverse(split(getreg('+'))))
        normal gv"+p
    finally
        call setreg('+', l:old_plus)
    endtry
endfunction
vnoremap <Leader>w :<C-u>call ReverseSelectedWords()<CR>
" Spell mistakes color
"highlight SpellBad cterm=bold ctermfg=white ctermbg=red
"highlight SpellCap cterm=bold ctermfg=red ctermbg=white
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
" source: https://www.vi-improved.org/vim-tips/
"augroup highlight_follows_focus
"    autocmd!
"    autocmd WinEnter * set cursorline
"    autocmd WinLeave * set nocursorline
"augroup END
"augroup highligh_follows_vim
"    autocmd!
"    autocmd FocusGained * set cursorline
"    autocmd FocusLost * set nocursorline
"augroup END
set guicursor+=n:blinkon1 " not blinking cursor in normal mode
"set guicursor+=i:blinkon1 " cursor blinkin in insert mode
set matchpairs=(:),{:},[:],<:>
" temporary solution for nvim cursor
"set guicursor=
set dictionary+=~/.dotfiles/nvim/words.txt     " C-x C-k C-n
"set nrformats+=alpha  " Increases/Decreases numbers with Ctrl-a/Ctrl-x correctrly
set laststatus=2      " statusline specific
set lazyredraw        " speed up macros
set mouse=a           " enable mouse click
set mousehide         " hide mouse while typing
set path+=**          " gf to open files under cursor
set scrolloff=2       " keep 2 lines when scrolling
set sidescrolloff=0
set ai                " set auto-indenting on for programming
set hidden            " Switch buffers without saving them
"set autowrite
"set autowriteall
set showcmd           " display incomplete commands
set display+=lastline
set nobackup          " do not keep a backup file
set number            " show line numbers
set ruler             " show the current row and column
set hlsearch          " highlight searches
set incsearch         " do incremental searching
set showmatch         " jump to matches when entering regexp
set ignorecase        " ignore case when searching
set infercase         " case inferred by default
set smartcase         " no ignorecase if Uppercase char present
set visualbell t_vb=  " turn off error beep/flash
set novisualbell      " turn off visual bell
set tabstop=4         " Number of spaces that a <Tab> in the file counts for
set formatoptions+=j  " Delete comment characters when joining lines
set title             " shows filename at the top
set expandtab         " Converts tab into spaces
set softtabstop=4     " number of spaces in tab when editing
set shiftwidth=4      " indented with the reindent operations with >> and <<
set shiftround        " when at 3 spaces, and I hit > go to 4, not 5
set backspace=indent,eol,start  " make that backspace key work the way it should
set t_RV= " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282
nmap <leader>l :set list!<CR>
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set lcs+=space:·,nbsp:•
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildignore+=*.so,*.pdf,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmenu
set wildmode=longest:full,list:full
set whichwrap +=<,>
set completeopt=longest,menuone
set nopaste
set pastetoggle=<F8>
set linebreak                  " Keep whole words during wrapping
set noshowmode
set autoread
set noerrorbells visualbell t_vb=
"" Copy/Paste/Cut
"if has('unnamedplus')
"  set clipboard=unnamed,unnamedplus
"endif
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
  silent !\curl -fLo ~/.dotfiles/nvim/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
call plug#begin(expand(glob('~/.config/nvim/plugged')))
"Plug 'mhinz/vim-startify'
"Plug 'henrik/vim-indexed-search'
"Plug 'coderifous/textobj-word-column.vim'
Plug 'w0rp/ale' ", { 'on': ['ALEToggle'] }
Plug 'rking/ag.vim', { 'on':  ['Ag'] }
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim' , { 'for': ['html', 'htmldjango', 'javascript.jsx', 'css'] }
Plug 'tpope/vim-abolish', { 'on': [] } "Advanced regex Substitution
"Plug 'tpope/vim-surround', { 'on': [] }
Plug 'tpope/vim-surround',
      \ { 'on': ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>CSurround',
      \ '<Plug>Ysurround',  '<Plug>YSurround', '<Plug>Yssurround',
      \ '<Plug>YSsurround', '<Plug>VSurround', '<Plug>VgSurround'] }
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular', { 'on': ['Tabularize'] }
Plug 'tommcdo/vim-exchange'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'nelstrom/vim-markdown-folding'
"Plug 'haya14busa/incsearch.vim'
"Plug 'timakro/vim-searchant'
"Plug 'inside/vim-search-pulse'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/VisIncr', { 'on': [] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kshenoy/vim-signature', { 'on': [] }
Plug 'vimwiki/vimwiki', { 'for': ['markdown', 'vimwiki'] }
Plug 'sjl/gundo.vim', { 'on': ['GundoToggle'] }
Plug 'chrisbra/NrrwRgn', { 'on': ['NR', 'NrrwRgn'] }
Plug 'tpope/vim-speeddating', { 'on': [] }
Plug 'jiangmiao/auto-pairs'
"Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-lion', { 'on': [] }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim', { 'on': [] }
Plug 'vim-scripts/CSApprox', { 'on': [] }
"Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
"Plug 'Yggdroot/indentLine'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'on': ['FZF', 'History', 'Files' ], 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim', { 'on': ['FZF', 'History', 'Files' ] }
endif
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips', {'on': [] } | Plug 'honza/vim-snippets', {'on': [] }
" Color
Plug 'trevordmiller/nova-vim'
Plug 'crusoexia/vim-monokai', { 'on': [] }
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'endel/vim-github-colorscheme'
Plug 'noahfrederick/vim-hemisu'
" statusline
"Plug 'itchyny/lightline.vim'
"Plug 'vim-scripts/Obvious-Mode'
"Plug 'maciakl/vim-neatstatus'
Plug 'voyeg3r/vim-neatstatus'
" Color picker
Plug 'lilydjwg/colorizer', { 'on': [] }
call plug#end()
" many plugins are disabled by default and called by
" this function for example: call LoadPluginFunction('vim-lion')
" and the command LoadPlugin plugin-name (whithout quotes)
" list unloaded plugins
" \v^Plug[^/]*\/\zs([^']*)\ze',\s+\{\s+'on':\s+[]
fun! LoadPluginFunction(plugin_name)
    let l:curpos = getcurpos()
    execute plug#load(a:plugin_name)
    call cursor(l:curpos[1], l:curpos[2])
    return ''
endfun
command! -nargs=1 LoadPlugin :call LoadPluginFunction(<q-args>)
" lazy load for ultisnips
" https://medium.com/@saaguero/improving-performance-in-vim-9b33598c8eaf
inoremap <silent> <C-j> <C-r>=LoadUltiSnips()<cr>
" This function only runs when UltiSnips is not loaded
function! LoadUltiSnips()
    let l:curpos = getcurpos()
    execute plug#load('vim-snippets')
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    call UltiSnips#ExpandSnippet()
    return ""
endfunction
" see surround lazy loading above
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap cS  <Plug>CSurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
nnoremap <F2> :NERDTreeToggle<cr>
" nnoremap <Leader>t :Commentary<cr>
" vnoremap <Leader>t :Commentary<cr>
" comment a paragraph → gcap
" Emacs like Ctrl-l - jumpt to Middle, Bottom and Top of the window
" Reference: http://vim.1045645.n5.nabble.com/Vim-General-f1139531.html
function! ToggleHML()
    set scrolloff=0
    let l:last_win_line = ( line('$') <= winheight('%') ? line('$')  : winheight('%')  )
    if winline() < l:last_win_line / 2
        normal M
    elseif winline() < l:last_win_line
        normal L
    else
        normal H
    endif
endfunction
nnoremap <C-l> :call ToggleHML()<CR>
" these lines are needed for ToggleComment()
" Reference: https://stackoverflow.com/a/24652257/2571881
autocmd FileType c,cpp,java      let b:comment_leader = '//'
autocmd FileType arduino         let b:comment_leader = '//'
autocmd FileType sh,ruby,python  let b:comment_leader = '#'
autocmd FileType zsh             let b:comment_leader = '#'
autocmd FileType conf,fstab      let b:comment_leader = '#'
autocmd FileType matlab,tex      let b:comment_leader = '%'
autocmd FileType vim             let b:comment_leader = '"'
function! ToggleComment()
    if exists('b:comment_leader')
        let l:pos = col('.')
        let l:space = ( &ft =~ '\v(c|cpp|java|arduino)' ? '3' : '2' )
        if getline('.') =~ '\v(\s*|\t*)' .b:comment_leader
            let l:space -= ( getline('.') =~ '\v.*\zs' . b:comment_leader . '(\s+|\t+)@!' ?  1 : 0 )
            execute 'silent s,\v^(\s*|\t*)\zs' .b:comment_leader.'[ ]?,,g'
            let l:pos -= l:space
        else
            exec 'normal! 0i' .b:comment_leader .' '
            let l:pos += l:space
        endif
        call cursor(line("."), l:pos)
    else
        echo 'no comment leader found for filetype'
    end
endfunction
nnoremap <Leader>t :call ToggleComment()<CR>
inoremap <Leader>t <C-o>:call ToggleComment()<CR>
xnoremap <Leader>t :'<,'>call ToggleComment()<CR>
" vnoremap <Leader>t :call ToggleComment()<CR>
" source: https://github.com/junegunn/vim-plug/issues/164
"command! Gstatus call LazyLoadFugitive('Gstatus')
"command! Gdiff call LazyLoadFugitive('Gdiff')
"command! Glog call LazyLoadFugitive('Glog')
"command! Gblame call LazyLoadFugitive('Gblame')
"
"function! LazyLoadFugitive(cmd)
"  call plug#load('vim-fugitive')
"  call fugitive#detect(expand('%:p'))
"  exe a:cmd
"endfunction
" lion it is an align plugin glip=
let b:lion_squeeze_spaces = 1
" some deoplete configurations
" inoremap <expr> <CR> pumvisible() ? '<C-e>' : '<CR>'
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#file#enable_buffer_path = 1
" <CR>: close popup and save indent.
" Now each Enter creates a undo point ":h i_Ctrl-g_u"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return deoplete#mappings#smart_close_popup() . "\<C-g>u\<CR>"
  return deoplete#mappings#smart_close_popup() . "\<CR>"
endfunction
" change until the end of line using
nnoremap Y y$
" Jump outside '"({
if !exists('g:AutoPairsShortcutJump')
  let g:AutoPairsShortcutJump = '<A-l>'
endif
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noinsert
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
let no_buffers_menu=1
" netrw config
let g:netrw_winsize = 25
" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"
let g:netrw_liststyle = 3
"colorscheme molokai
set t_Co=256   " This is may or may not needed.
set background=dark
"if strftime("%H") < 7
"  set background=dark
"else
"  set background=light
"endif
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
colorscheme PaperColor
"colorscheme palenight
" When double click a word vim will hightlight all other ocurences
" see CountWordFunction()
" [I shows lines with word under the cursor
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>:CountWord<cr>
nnoremap <Leader>* :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>:CountWord<cr>
nnoremap <F4> ggVGg?
nnoremap <F5> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
" source: http://tilvim.com/2013/07/31/swapping-bg.html <F19> = Shif-F7
nmap <F19> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
" close the buffer
nnoremap <Leader>db :bd!<CR>
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
" list buffers and jump to a chosen one
nnoremap <Leader>b :ls<CR>:b<Space>
" sometimes you need to know how many opened buffers you have
" source: https://superuser.com/a/1221514/45032
fun! CountBuffers() abort
    "let l:total = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:total = len(getbufinfo({'buflisted':1}))
    echom "you have " . l:total . " opened buffers!"
endfun
command! -nargs=0 Nbufs :call CountBuffers()
fun! AddLineNumber()
    %s/^/\=printf('%02d ', line('.'))
endfun
" this function gets last 20 cmds to new buffer
fun! s:RedirHistoryCommands()
    set paste
    redir @r
    history : -20,
    redir End
    new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    put r
    set nopaste
    :silent %s/^\s\+//g
    :silent g/^$/d
endfun
command! -nargs=0 GetHistory call s:RedirHistoryCommands()
command! -nargs=1 H execute histget("cmd", 0+<args>)
command! -nargs=1 Hg let @h = histget("cmd", 0+<args>)
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")
  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
  echom "All other buffers unloaded!"
endfunction
"nnoremap <silent> <Leader>c :call CloseAllBuffersButCurrent()<CR>
nnoremap <Leader>c :call CloseAllBuffersButCurrent()<CR>
command! -nargs=0 CloseBuffers :call CloseAllBuffersButCurrent()
" substitute word under cursor - This map is used for spell
" nnoremap <Leader>s :call Preserve('%s/\<<C-r><C-w>\>//g\<left><left>')
" Scroll split window
nnoremap <C-M-k> <c-w>w<c-y><c-w>w
nnoremap <C-M-j> <c-w>w<c-e><c-w>w
" resise windows
nnoremap <M-=> <C-w>+
nnoremap <M--> <C-w>-
syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type
" My font is fira mono regular stled on gnome-shell
" line text-objectsl
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!_vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
command! -nargs=0 Reindent :call Preserve('exec "normal! gg=G"')
command! MakeTags !ctags -R .
" create a scratch window - rascunho
command! Scratch new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
cab SC Scratch
"  when searching next patter put it in the middle of screen (I use indexsearch plugin)
let g:indexed_search_center=1
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <c-o> <c-o>zz
" select last paste in visual mode
" With <Leader>p we easily select the pasted text and we fix the indentation with  <  or >.
" nnoremap <expr> <Leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap gp `[v`]
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
" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
"*****************************************************************************
"" Functions
"*****************************************************************************
function! ListLeaders()
     silent! redir @a
     silent! nmap <LEADER>
     silent! redir END
     silent! new
     silent! put! a
     silent! g/^s*$/d
     silent! %s/^.*,//
     silent! normal ggVg
     silent! sort
     silent! let lines = getline(1,"$")
endfunction
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif
" join lines keeping cursor position
nnoremap J :call Preserve(':join')<CR>
nnoremap <Leader>J :call Preserve(':join!')<CR>
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" It adds motions like 25j and 30k to the jump list, so you can cycle
" through them with control-o and control-i.
" source: https://www.vi-improved.org/vim-tips/
" nnoremap <expr> j v:count ? (v:count > 1 ? "m'" . v:count : '') . 'j' : 'gj'
" nnoremap <expr> k v:count ? (v:count > 1 ? "m'" . v:count : '') . 'k' : 'gk'
" to insert this result: --> :put =Randnum(1000)
function! Randnumber(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction
fun! CleanFlaschards() abort
    %w! output.csv-backup
    let @a = 'gg0vg_ydd}}{jA[sound:0];JdapGopgg'
    let @b = 'vg_ydd}{jA[sound:0];J:g/^$/exec "normal! ddgg":%normal! A;MairoVergara:w'
    %s/<script\_.\{-}<\/script>//ge
    %s/\v\<(\/)?(p|em|strong|br)(\/)?\>//ge
    %s/\v\<\/?span([^>]*)?\>//ge
    g/^(.*)/d
    g/compartilhe o post/exec 'normal! dG'
    g/p style/exec 'normal! dip'
	g/v((vamos (então )?aos |(ver|veja|seguem) (os|alguns)? )?exemplos( abaixo)?)|anki/exec 'normal! dip'
	g/\v(no post de hoje)/exec 'normal! dip'
    g/repetição espaçada/exec 'normal! dip'
    0r !ls *.mp3 | sort -n -k1
	normal! ogg
    g/\.mp3$/s/^\d\+-//g
	g/.*mp3/s,%E2%80%99\|%E2%80%93\|%E2%80%98\|%E2%80%9,_,ge
	g/.*\.mp3/s,%E2%80%9C\|%E2%80%9D,,ge
    g/PDF+MP3/exec 'normal dG\<Enter>'
	%s,\(\.\)\(<\/b>\)$,\2\1,ge
    %s/^\n\{2,}/\r/ge
	normal ggvip
	let selectionsize = line("'>") - line("'<") + 1
	echom "Execute a macro 'a' " . (selectionsize - 1) . " vezes"
    " perl-rename 's/^[0-9]-//g' *.mp3
endfun
command! -nargs=0 CFlashcards :silent call CleanFlaschards()
" This function requires you select the numbers
" source: https://vi.stackexchange.com/a/4699/7339
"fun! SumVis() abort
"    try
"        let l:a_save = @a
"        norm! gv"ay
"        let @a = substitute(@a,'[^0-9. ]','+','g')
"        exec "norm! '>o"
"        exec "norm! iTotal: \<c-r>=\<c-r>a\<cr>"
"     finally
"        let @a = l:a_save
"     endtry
"endfun
"vnoremap <C-s> :<C-u>call SumVis()<CR>
function! MoveEm(position)
  let saved_cursor = getpos(".")
  keepjumps execute 'normal {'
  if getline('.') !~ '^$'
    let previous_blank_line = line('.') - 1
  else
    let previous_blank_line = line('.')
  endif
  let target_line = previous_blank_line + a:position - 1
  if target_line > getpos('.')[1]
      let target_line += 1
  endif
  call setpos('.', saved_cursor)
  execute 'move ' . target_line
  call setpos('.', saved_cursor)
endfunction
for position in range(1, 9)
  execute 'nnoremap m' . position . ' :call MoveEm(' . position . ')<cr>'
endfor
" this function increases each number in a copyied function
" fun! CopyAndIncrease()
"     try
" 		let l:old_copy = getreg('0')
" 		normal yip
" 		let @0 = substitute(@0,'\d\+','\=submatch(0) + 1','g')
" 		exec "normal }O\<Esc>p"
" 	finally
" 	    call setreg('0', l:old_copy)
" 	endtry
" endfun
" command! -nargs=0 CopyIncrease silent call CopyAndIncrease() | exec "normal \<Esc>"
" nnoremap <Leader>c :CopyIncrease<CR>
" swap words without changing cursor position gw
" swap words changing cursor position gr
" swap with previous word gl
"nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
"nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
"nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
" search visually selected text
"vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>'
" Get hid of E488: https://vi.stackexchange.com/questions/4689/
" Remove the trailing <cr> That is only needed for mappings, but not for commands.
" map ,* *<C-O>:%s///gn<CR>``
" There is no need to save search register because we are using "exec" which
" does not change search register
fun! CountWordFunction()
    try
        let l:win_view = winsaveview()
        exec "%s/" . expand("<cword>") . "//gn"
    finally
        call winrestview(l:win_view)
    endtry
endfun
command! -nargs=0 CountWord :call CountWordFunction()
" map to count word under cursor
" https://stackoverflow.com/a/11492536/2571881
" nnoremap <f3> :execute ":%s@\\<" . expand("<cword>") . "\\>\@&@gn"<CR>
" see function CountWordFunction
nnoremap <F3> :CountWord<CR>
" Insert lines below and above (with count)
" nnoremap <silent> <Leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <Leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Autocmd Rules **********************************
"colorscheme ayu
"colorscheme palenight
"colorscheme hemisu
" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrcFunction')
    function! ReloadVimrcFunction()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfunction
endif
augroup Reload
    autocmd!
    autocmd BufWritePost $MYVIMRC call ReloadVimrcFunction()
    "autocmd BufWritePost $MYVIMRC filetype plugin indent on
augroup end
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
autocmd BufEnter * silent! lcd %:p:h
" python
augroup python
    au FileType python set keywordprg=pydoc
    au! BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    au! BufRead,Bufnewfile *.py im :<CR> :<CR><TAB>
    au! BufWritePre *.py,*.js :call <SID>StripTrailingWhitespace()
    au! BufNewFile *.py 0r ~/.vim/skel/template.py
    "au BufNewFile *.py call Preserve('1,5s/Created:\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
    au BufNewFile *.py call Preserve('1,5s/\(Last Change\|Created\):\s\+\zs.*/\=strftime("%Y %b %d %H:%M")/ei')
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
	autocmd FileType python nnoremap <buffer> <Leader>c I#<esc>
    autocmd FileType python xnoremap <buffer> <Leader>c :normal I#<CR>
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
""    autocmd FileType markdown,vimwiki setlocal textwidth=78 formatprg=par\ -w78
"     autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setlocal ft=markdown
"augroup END
"augroup spellcheck_documentation
"     autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*,txt} setlocal spell
"    " Don't mark URL-like and acronyms things as spelling errors
"    syn match UrlNoSpell "\v(https?|ftp):[^[:space:]]*" contains=@NoSpell
"    syn match AcronymNoSpell '\v\u{2,}(\d+)?' contains=@NoSpell
"    syn match myExCapitalWords '+\<[A-Z]\w*\>+' contains=@NoSpell
"augroup END
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
    au FileType html,htm exe ":silent 1,$!tidy --indent yes -q"
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
"" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>
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
" nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>m :History<cr>
nnoremap <silent> <Leader>e :FZF -m ~/.dotfiles<CR>
"command! FZFMru call fzf#run({
"\  'source':  v:oldfiles,
"\  'sink':    'e',
"\  'options': '-m -x +s',
"\  'down':    '40%'})
"nnoremap ,m :FZFMru<cr>
" snippets
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
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
"nnoremap <silent> <F4> :TagbarToggle<CR>
"let g:tagbar_autofocus = 1
" Disable visualbell
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"" Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv
"" Move lines in all modes with Ctrl-k Ctrl-j
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>
" delete current till the end of line
inoremap <C-k> <C-o>C
nnoremap <C-k> _D
" Delete line above without moving the cursor
" https://vi.stackexchange.com/a/8368/7339
function! DeleteLineAbove()
    if line('.') == 1
        echom "You are at the first line!"
        return
    endif
    let l:colsave = col(".")
    exec  "normal! kdd"
    call cursor(line("."), l:colsave)
endfunction
nnoremap <Leader>k :call DeleteLineAbove()<CR>
" https://vi.stackexchange.com/a/4171/7339
"function! DeleteOver()
"   let save_cursor = getpos(".")
"   normal k
"   normal dd
"   call setpos(".", save_cursor)
"   normal k
"endfunction
"nnoremap <Leader>k :call DeleteOver()<CR>
function! DeleteUnder()
   let save_cursor = getpos(".")
   normal j
   normal dd
   call setpos(".", save_cursor)
endfunction
nnoremap <Backspace> :call DeleteUnder()<CR>
" https://vi.stackexchange.com/a/7278/7339
" https://superuser.com/a/147842/45032
" Insert new line above and below in normal mode
" unimpaired [<space ]<space>
" nnoremap <CR> :call append(line('.'), '')<CR>
" nnoremap <A-CR> :call append(line('.')-1, '')<CR>
" Here we have some shortcuts (above)
" <CR> ............... add new line below in normal mode
" <A-CR> ............. add new line above in normal mode
" <Leader>k .......... removes line above in normal mode
" <Backspace> ........ removes line below in normal mode
" Make Ctrl-e jump to the end of the current line in the
" insert mode. This is handy when you are in the middle of
" a line and would like to go to its end without switching
" to the normal mode.
" inoremap <C-e> <C-o>$
" it makes me lose my completion of the line below
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
"nnoremap <Leader>l :call MruFile()<cr>
command! -nargs=0 Mrf call MruFile()
" Hey brazilian portuguese users! what you are waiting for?
nnoremap ç :
" fzf configuration
" <C-p> to search files
nnoremap <silent> <c-p> :FZF -m ~/.dotfiles<cr>
" end - fzf configuration
nnoremap <silent> <Leader>f :Files ~/<cr>
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
autocmd BufWinLeave <buffer> call clearmatches()
"autocmd BufWinLeave * call StripTrailingWhitespace()
" source: https://www.vi-improved.org/recommendations/
function! StripTrailingWhitespace() range
    if !&binary && &filetype != 'diff'
        call Preserve('%s/\s\+$//e')
    endif
endfunction
com! Cls :call StripTrailingWhitespace()
com! StripTrailingSpace :call StripTrailingWhitespace()
au! BufwritePre *.md,*.py,*.sh,*.zsh,*.txt :call StripTrailingWhitespace()
cnoreabbrev cls StripTrailingSpace
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
        call append(0, "Arquivo:")
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
    endif
endfun
command! -nargs=0 CH :call ChangeHeader()
au! BufWritePre * :silent call ChangeHeader()
" jump to next place holder
function! JumpToNextPlaceholder() abort
    let old_query = getreg('/')
    echo search("<+.\\++>")
    exec "norm! c/+>/e\<CR>"
    call setreg('/', old_query)
endfunction
nnoremap <special> <Leader>p :keepjumps call JumpToNextPlaceholder()<CR>a
inoremap <special> <Leader>p <ESC>:keepjumps call JumpToNextPlaceholder()<CR>a
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" map Ctrl-k in inserto mode to delete til the end of line
" inoremap <C-k> <C-o>d$
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
" using 'execute' command doesn't overwrite the last search pattern, so I
" don't need to store and restore it.
if !exists('*Preserve')
    function! Preserve(command) range
        try
            let l:win_view = winsaveview()
            silent! execute 'keepjumps' . a:command
        finally
            call winrestview(l:win_view)
        endtry
    endfunction
endif
vnoremap <Leader>f :call Preserve("'<,'>!fmt -w 60")<CR>
nnoremap <Leader>f :call Preserve("%!fmt -w 60")
" remove consecutive blank lines
" see Preserve function definition
fun! DelBlankLines() range
    if !&binary && &filetype != 'diff'
        call Preserve('%s/\s\+$//e')
        call Preserve('%s/^\n\{2,}/\r/ge')
    endif
endfun
command! -nargs=0 DelBlank :call DelBlankLines()
" delete sucessive blank lines and trailing spces
nnoremap <special> <Leader>d :call DelBlankLines()<cr>
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
command! SaveAsRoot w !sudo tee %
cnoreabbrev sudow SaveAsRoot
cnoremap <c-a> <home>
cnoremap <c-e> <end>
inoremap <C-a> <C-o>^
" to reselect use gv in normal mode - Shift-F11
nnoremap <F23> <ESC>:set hls! hls?<cr>
inoremap <F23> <C-o>:set hls! hls?<cr>
vnoremap <F23> <ESC>:set hls! hls?<cr> <bar> gv
" alternate between relative number, number and no number
set nu rnu
" nmap <F6> :set nu rnu<cr>
nnoremap <F6> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
" noremap <silent> <Leader>v :e ~/.config/nvim/init.vim<cr>
noremap <silent> <Leader>v :e $MYVIMRC<cr>
" Run current line as a vim command
" https://stackoverflow.com/a/19884862/2571881
" :exec getline('.')
"read the current line into command line
cnoremap <c-r><c-l> <c-r>=getline('.')<CR>
nnoremap <C-x><C-e> :<C-r>=getline('.')<CR>
" mapeamento para abrir e fechar folders em modo normal usando
" a barra de espaços -- zR abre todos os folders
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
hi Folded ctermbg=black
if exists(":python3")
   let g:_uspy=":python3"
   let g:ultisnipsusepythonversion = 3
endif
let g:UltiSnipsSnippetsDir = expand("~/.dotfiles/vim/snips/")
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]
map <Leader>u :UltiSnipsEdit<cr>
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
