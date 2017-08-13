" vim:set et sw=4 ts=4:fdl=3
" Arquivo de configuração do vim
" Criado: Qua 02/Ago/2006 hs 09:19
" Last Change: dom 13 ago 2017 12:49:38 -03
" Autor: Sergio Luiz Araujo Silva
" Codificação: utf-8
" Site: http://vivaotux.blogspot.com
" Mail: voyeg3r ✉ gmail
" Twitter: http://www.twitter.com/voyeg3r
" Licence: Licença: Este arquivo é de domínio público

"                 ( O O )
"  +===========oOO==(_)==OOo==============+
"  |                                      |
"  |    °v°    Sergio Luiz Araujo Silva   |
"  |   /(_)\  Linux User #423493          |
"  |    ^ ^    voyeg3r ✉ gmail.com        |
"  +======================================+

if has('vim_starting')
  set nocompatible               " Be iMproved
endif

set path+=**

if executable('zsh')
    set shell=zsh\ -l
endif

set mouse=a

" Avoid lags
set lazyredraw

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

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

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'godlygeek/csapprox'
Plug 'endel/vim-github-colorscheme'
Plug 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/VisIncr'
Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-markdown'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimshell.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomasr/molokai'


"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" mostra +++ no começo de linhas longas sem wrap
set showbreak=+++
nnoremap <leader>l :set list! list?<cr>

set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
set lcs+=space:·


nnoremap <F23> :set hls!<CR>
inoremap <F23> <C-o>:set hls!<cr>
vnoremap <F23> <ESC>:set hls!<cr> <bar> gv

map <silent> <leader>v :e ~/.dotfiles/nvim/init.vim<cr>
map <silent> <leader>z :e ~/.dotfiles/zsh/zshrc<cr>

" mapeamento para abrir e fechar folders em modo normal usando
" a barra de espaços -- zR abre todos os folders
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" snippets settings
"let g:UltiSnips#ListSnippets="<C-tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"

map <leader>u :UltisnipsEdit<cr>
imap <leader>u <c-o>:UltisnipsEdit<cr>

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

" Buble single lines - mover linhas
" http://vimcasts.org/episodes/bubbling-text/
nmap <special> <c-up> ddkP
nmap <special> <c-down> ddp
"buble multiple lines
xmap <c-up> xkP`[V`]
xmap <c-down> xp`[V`]

nmap ,f :FZF ~/.dotfiles<cr>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

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

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme molokai
endif

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

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

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
noremap <F2> :NERDTreeToggle<CR>

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

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

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************


"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
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
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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

function! <SID>SwitchColorSchemes()
 if exists("g:colors_name")
	  if g:colors_name == 'molokai'
			colorscheme xoria256
	  elseif g:colors_name == 'xoria256'
			colorscheme tango-morning
	  elseif g:colors_name == 'tango-morning'
			colorscheme guepardo
	  elseif g:colors_name == 'guepardo'
			colorscheme tango
	  elseif g:colors_name == 'tango'
			colorscheme vividchalk
	  elseif g:colors_name == 'vividchalk'
			colorscheme mustang
	  elseif g:colors_name == 'mustang'
			colorscheme underwater-mod
	  elseif g:colors_name == 'underwater-mod'
			colorscheme maroloccio
	  elseif g:colors_name == 'maroloccio'
			colorscheme wombat
	  elseif g:colors_name == 'wombat'
			colorscheme chrysoprase
	  elseif g:colors_name == 'chrysoprase'
			colorscheme quagmire
	  elseif g:colors_name == 'quagmire'
			colorscheme digerati
	  elseif g:colors_name == 'digerati'
			colorscheme vitamins
	  elseif g:colors_name == 'vitamins'
			colorscheme eclm_wombat
	  elseif g:colors_name == 'eclm_wombat'
			colorscheme native
	  elseif g:colors_name == 'native'
			colorscheme vibrantink
	  elseif g:colors_name == 'vibrantink'
			colorscheme ir_black
	  elseif g:colors_name == 'ir_black'
			colorscheme molokai
	  endif
 endif
endfunction
map <silent> <F18> <esc>:call <SID>SwitchColorSchemes()<CR><bar>:echo g:colors_name<cr>

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
com! Cls :call CleanExtraSpaces()

" rola janela alternativa
fun! ScrollOtherWindow(dir)
    if a:dir == "down"
    let move = "\<C-E>"
    elseif a:dir == "up"
    let move = "\<C-Y>"
    endif
    exec "normal \<C-W>p" . move . "\<C-W>p"
endfun
nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>

" remove consecutive blank lines
" see Preserve function definition
fun! DelBlankLines()
    keepjumps call Preserve("g/^\\n\\{2,}/d")
    "keepjumps call Preserve("g/^$/,/./-j")
endfun
command! -nargs=0 DelBlank :call DelBlankLines()

"    dos2unix ^M
fun! Dos2unixFunction()
    call Preserve("%s/$//g")
    "call Preserve("%s/\\x0D$//")
    set ff=unix
    set bomb
    set encoding=utf-8
    set fileencoding=utf-8
endfun
com! Dos2Unix call Dos2unixFunction()

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

fun! ChangeHeader()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    1,10s/\vLast Change:(\s+|\t+)\zs(.*)/\=strftime("%c")/e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
command! -nargs=0 CH :call ChangeHeader()

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

" function to clear all registers
" http://stackoverflow.com/questions/19430200/how-to-clear-vim-registers-effectively
fun! s:ClearRegs()
    "let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    "for r in regs
    "    call setreg(r, [])

    "endfor
    for i in range(34,122) | silent! call setreg(nr2char(i), [])  | endfor
endfun
command! -nargs=0 Cregs call s:ClearRegs()

iab -> →
iab tambem também
iab fro for
iab ,m <voyeg3r  gmail.com>
iab mymail <voyeg3r  gmail.com>
iab slas Sérgio Luiz Araújo Silva
iab vc você
iab teh the
iab a. ª
iab analize análise
iab angulo ângulo
iab apos após
iab apra para
iab aqeule aquele
iab aqiulo aquilo
iab arcoíris arco-íris
iab aré até
iab asim assim
iab aspeto aspecto
iab assenção ascenção
iab assin assim
iab assougue açougue
iab aue que
iab augum algum
iab augun algum
iab ben bem
iab beringela berinjela
iab bon bom
iab cafe café
iab caichote caixote
iab capitões capitães
iab cidadães cidadãos
iab ckaro claro
iab cliche clichê
iab compreenssão compreensão
iab comprensão compreensão
iab comun comum
iab con com
iab contezto contexto
iab corrijir corrigir
iab coxixar cochichar
iab cpm com
iab cppara para
iab dai daí
iab danca dança
iab decer descer
iab definitamente definitivamente
iab deshonestidade desonestidade
iab deshonesto desonesto
iab detale detalhe
iab deven devem
iab díficil difícil
iab distingeu distingue
iab dsa das
iab dze dez
iab ecessão exceção
iab ecessões exceções
iab eentão e então
iab emb bem
iab ems sem
iab emu meu
iab en em
iab enbora embora
iab equ que
iab ero erro
iab erv ver
iab ese esse
iab esselência excelência
iab esu seu
iab excessão exceção
iab Excesões exceções
iab excurção excursão
iab Exenplo exemplo
iab exeplo exemplo
iab exijência exigência
iab exijir exigir
iab expontâneo espontâneo
iab ezemplo exemplo
iab ezercício exercício
iab faciu fácil
iab fas faz
iab fente gente
iab ferias férias
iab geito jeito
iab gibóia jibóia
iab gipe jipe
iab ha há
iab hezitação hesitação
iab hezitar hesitar
iab http:\\ http:
iab iigor igor
iab interesado interessado
iab interese interesse
iab Irria Iria
iab isot isto
iab ítens itens
iab ja já
iab jente gente
iab linguiça lingüiça
iab masi mais
iab maz mas
iab con com
iab mema mesma
iab mes mês
iab muinto muito
iab nao não
iab nehum nenhum
iab nenina menina
iab noã não
iab no. nº
iab N. Nº
iab o. º
iab obiter obter
iab observacao observação
iab ons nos
iab orijem origem
iab ospital hospital
iab poden podem
iab portugu6es português
iab potuguês português
iab precisan precisam
iab própio próprio
iab quado quando
iab quiz quis
iab recizão rescisão
iab sanque sangue
iab sao são
iab sen sem
iab sensivel sensível
iab sequéncia seqüência
iab significatimente significativam
iab sinceranete sinceramente
iab sovre sobre
iab susseder suceder
iab tanbem também
iab testo texto
iab téxtil têxtil
iab tydo tudo
iab tuiter http://www.twitter.com/voyeg3r
iab una uma
iab unico único
iab utilise utilize
iab vega veja
iab vivaotux http://vivaotux.blogspot.com
iab vja veja
iab voc6e você
iab wue que
iab xave chave

iab 1a. 1ª
iab 2a. 2ª
iab 3a. 3ª
iab 4a. 4ª
iab 5a. 5ª
iab 6a. 6ª
iab 7a. 7ª
iab 8a. 8ª
iab 9a. 9ª
iab 10a. 10ª
iab 11a. 11ª
iab 12a. 12ª
iab 13a. 13ª
iab 14a. 14ª
iab 15a. 15ª

" caso o teclado esteja desconfigurado use:
"iab 'a á
"iab 'e é
"iab 'i í
"iab 'o ó
"iab ~a ã
"iab ^a â
"iab `a à
"iab ,c ç
"iab ^e ê
"iab ^o ô
"iab ~o õ
"iab 'u ú
