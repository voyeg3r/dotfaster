# zshell.md - Last Change: 2018 mai 22 09:25
Arquivo: zshell tips and tricks

+ [[autrageously zsh tips](autrageously-zsh-tips.md)]

see also [zshtips](zshtips.md)

# References:
+ http://zshwiki.org/home/builtin/functions/zmv
+ http://blog.patshead.com/2013/04/more-powerful-zsh-history-search-using-zaw.html
+ http://chneukirchen.org/dotfiles/.zshrc
+ http://wonderwall.hatenablog.com/entry/2016/06/19/192429
+ http://awesome-shell.readthedocs.io/en/latest/README/
+ http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/
+ https://libraries.io/github/unixorn/awesome-zsh-plugins
+ https://raw.githubusercontent.com/sorin-ionescu/prezto/28a20b48e652a01216a6c3dd76e6324d76c12def/modules/editor/init.zsh
+ https://coderwall.com/t/zsh/popular

# zsh startup file
+ http://zsh.sourceforge.net/Intro/intro_3.html

There are five startup files that zsh will read commands from:

    $ZDOTDIR/.zshenv
    $ZDOTDIR/.zprofile
    $ZDOTDIR/.zshrc
    $ZDOTDIR/.zlogin
    $ZDOTDIR/.zlogout

# manuals

    man zsh          Zsh overview
    man zshmisc      Anything not fitting into the other sections
    man zshexpn      Zsh command and parameter expansion
    man zshparam     Zsh parameters
    man zshoptions   Zsh options
    man zshbuiltins  Zsh built-in functions
    man zshzle       Zsh command line editing
    man zshcompwid   Zsh completion widgets
    man zshcompsys   Zsh completion system
    man zshcompctl   Zsh completion control
    man zshmodules   Zsh loadable modules
    man zshzftpsys   Zsh built-in FTP client
    man zshall       Meta-man page containing all of the above
    info --index-search=age zsh         # get man info for zsh function age *N*

    ``` markdown
    zinfo(){info --index-search=$1 zsh} *N*
    ```

# Setting options

    setopt extended_glob
    setopt glob_dots

In order to check any option just type

    setop | grep 'what you mean'
    if [[ $options[extended_glob] = on ]]; then …

    [[ -o extended_glob ]]

That also works in bash, but only for the options set by set -o, not those set by shopt. zsh has only one set of options which can be set with either setopt or set -o.

Just like with bash (or any POSIX shell), you can also do set -o or set +o to see the current option settings.

# What does autoload do in zsh?
+ https://stackoverflow.com/a/30840986/2571881

    autoload -Uz vcs_info

The -U means mark the function vcs_info for autoloading and suppress alias expansion. The -z means use zsh (rather than ksh) style. See also the functions command.

# playing audio files without extension

    for i in `ls *`; do
        [[ $(file $i | grep -o 'Audio') == 'Audio' ]] && mpg123 $i
        sleep 2
    done

# Conditional expressions

	``` zsh
	[[ -n file*(#qN) ]]
	```

produces status zero if and only if there is at least one file in the current
directory beginning with the string 'file'. The globbing qualifier N ensures
that the expression is empty if there is no matching file.

# Lazy load function

``` markdown
# Lazy Load to speed up zsh start
# read more here: https://github.com/xcv58/prezto/tree/master/modules/lazy-load
#
#   Authors: xcv58 <i@xcv58.com>

function lazy_load() {
    local load_func=${1}
    local lazy_func="lazy_${load_func}"

    shift
    for i in ${@}; do
        alias ${i}="${lazy_func} ${i}"
    done

    eval "
    function ${lazy_func}() {
        unset -f ${lazy_func}
        lazy_load_clean $@
        eval ${load_func}
        unset -f ${load_func}
        eval \$@
    }
    "
}

function lazy_load_clean() {
    for i in ${@}; do
        unalias ${i}
    done
}
# End of lazy load definition
```

# how do I correctly negate zsh globbing expressions?
+ https://superuser.com/a/403617/45032

Try either:

	ls -l ^*.owp

(i.e. match anything except the pattern *.owp)

or:

	``` zsh
	ls -l *~*.owp

	for i in **/*.mp3; mpg123 $i
	```

Somtimes we can just do:

``` zsh
mpg123 **/*.mp3
```

Yet another way to achieve it is

	 print *(/)

or

	 echo *(/)

A bit more correct version (as noted by @Stéphane Chazelas) would be

	print -rl -- *(/)

or

	echo -E - *(/)

to take care about spaces (-l), escape sequences (-r/-E) and leading hyphens (--/-) inside filenames.

Yet even more correct version is print -rN which additionally takes care of
linebreaks inside filenames (linux allows them, windows doesn't) by separating
the results with nulls, for example:

``` zsh
print -rN -- **/*(/) | xargs -0 -n10 chmod g+s
```

which recursively sets setguid bit - selectively addressing directories, as
opposed to chmod -R g+s.

For huge trees this only processes a part of files (due to the limit on
command line length) and silently leave the rest as is. The following commands
can handle this situation:

	find . -type d -print0 | xargs -0 -n10 chmod g+s

(i.e. match anything that matches the pattern * but does not match *.owp)

	See man zshexpn => FILENAME GENERATION => Glob Operators for more on this.

# A better fuzzy finder

    fzy

# Get directory of an executable using which
+ https://stackoverflow.com/a/45664616/2571881

This tip only works on zsh

    cd =python3(:h)

# Testing commands existence

	``` zsh
	# not aliasing rm -i, but if safe-rm is available, use condom.
    if (( ${+commands[safe-rm]} )); then
      alias rm='safe-rm'
    fi
	```

# improving zsh performance
+ https://www.zsh.org/mla/users/2015/msg00904.html

```markdown
	ssume starting here with the default $fpath
```

```zsh
    	zsh_default_functions=~/.zsh-default-functions.zwc
    	if ! zcompile -t $zsh_default_functions >&/dev/null
    		then
	        # File is missing or out of date.  Rebuild it.
      	        # Removes the file if any function cannot be compiled.
      		zcompile $zsh_default_functions $^fpath/*(N.:A)
   	 fi
    	if [[ -f $zsh_default_functions ]]
   		 then
     		 fpath=( $zsh_default_functions )
      		autoload -w $zsh_default_functions
   	 fi
```

# bindkey
In order to get control characters just type

``` markdown
cat <Enter>
```

Now you can type your key sequences in order to get your combination

## Fixing delete char on zsh

	bindkey "\e[3~" delete-char

What are the step to move all your dotfiles into XDG directories?
+ https://superuser.com/a/874924/45032

The variable $XDG_CONFIG_HOME must be used to this task

    echo $XDG_CONFIG_HOME
    /home/sergio/.config

 ``` markdown
 One may edit /etc/zsh/zshenv to set `$XDG_CONFIG_HOME` directories and `$ZDOTDIR`. This require write privilegies on this files though.
 ```

    ``` sh
    export XDG_CONFIG_HOME="${HOME}/.config"
    export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
    ```

Other config would be placed on it...

``` sh
# gnupg
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

# ICEauthority
export ICEAUTHORITY=${XDG_CACHE_HOME}/ICEauthority

#  less
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"

# mplayer
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer

# subversion
export SUBVERSION_HOME=$XDG_CONFIG_HOME/subversion

# vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"
```

# Adicionando um tema ao zsh quase puro

There is a quick and easy way to set up a colored prompt in Zsh. Make sure that
prompt theme system is set to autoload in .zshrc. This can be done by adding
these lines to:

``` zsh
~/.zshrc

autoload -Uz promptinit
promptinit

Available prompt themes are listed by running the command:

# $ prompt -l

For example, to use the walters theme, enter:

$ prompt walters

To preview all available themes, use this command:

$ prompt -p
```

# zrecompile --> man zshcontrib
+ https://github.com/Eriner/zim/issues/86

A builtin module to speed up your zsh
Assume starting here with the default $fpath

```zsh
zsh_default_functions=~/.zsh-default-functions.zwc
if ! zcompile -t $zsh_default_functions >&/dev/null
then
	# File is missing or out of date.  Rebuild it.
	# Removes the file if any function cannot be compiled.
	zcompile $zsh_default_functions $^fpath/*(N.:A)
fi
if [[ -f $zsh_default_functions ]]
then
	fpath=( $zsh_default_functions )
	autoload -w $zsh_default_functions
fi
```

# Better completion

    zmodload zsh/complist
    autoload -U compinit && compinit

    zstyle ':completion:*' accept-exact '*(N)'
    zstyle ':completion:*' use-cache on
    zstyle ':completion::complete:*' cache-path .zcache
    zstyle ':completion:*' cache-path ~/.zsh/cache
    zstyle ':completion:*' group-name ''

# complementação de histórico

there is something in zsh called history-beginning-search-menu. if you put:

    autoload -Uz history-beginning-search-menu
    zle -N history-beginning-search-menu
    bindkey '' history-beginning-search-menu

in your .zshrc file. then for example:

# Adicionando uma linha ao histórico do zsh sem rodar o comando

    print -S "echo esta linha vai pro histórico"

# What files run when you start a ZSH login shell?
+ https://kev.inburke.com/kevin/profiling-zsh-startup-time/

In order, your machine will load/execute the following files when ZSH starts:

    /etc/zshenv
    ~/.zshenv
    /etc/zprofile
    ~/.zprofile
    /etc/zshrc
    ~/.zshrc
    /etc/zlogin
    ~/.zlogin

# zsh-lovers

    sudo pacman -Syu zsh-lovers
    just type: man zsh-lovers

# Testing zsh start speed

    time zsh -i -c exit

# Auto suggestions plugin

+ https://github.com/zsh-users/zsh-autosuggestions

# zsh auto-pairs plugin

+ https://github.com/hlissner/zsh-autopair
+ https://github.com/zsh-users/zsh-autosuggestions
+ [list of plugins](https://github.com/unixorn/awesome-zsh-plugins#plugins)
+ [zsh like sensible](https://github.com/willghatch/zsh-saneopt)

# zplug plugin manager
+ https://github.com/zplug/zplug

    export ZPLUG_HOME=$HOME/.dotfiles/rcfiles/zsh/zplug
    git clone https://github.com/zplug/zplug $ZPLUG_HOME

    curl -sL zplug.sh/installer | zsh

# config zplug

    source ~/.zplug/init.zsh
    source ~/.dotfiles/rcfiles/zsh/zplug/init.zsh

# Dealing with variables
+ https://unix.stackexchange.com/a/119442/3157

    LIST=(HOME MAIL EDITOR)
    for VAR in ${LIST}
    do
         print "${VAR}:  ${(P)VAR}"
    done

    HOME:  /home/sergio
    MAIL:  /var/spool/mail/sergio
    EDITOR:  vim

# arrays in zshell

# Smart cd

``` markdown
.dot/r/v/b<tab>
.dotfiles/rcfiles/vim/bundle/

for f (**/*.txt) {echo $f}

# to negate some extensions you can do:
setopt extended_glob
ls functions/^*(-mp3|.zsh)
```

# Create an array of lines from a file

``` sh
buffer=("${(f)$(< /etc/hosts)}")
echo $buffer[1]
127.0.0.1       eva-O1.linagora.com     eva-01
```

# Edit environment easily
+ https://medium.com/@gpedro/o-que-eu-aprendi-com-zsh-e-porque-voce-deve-usar-99ea596f840e

    vared PATH

# Repeating strings

    sudo pacman -S {,gst-{libav,plugins-{bad,base,good,ugly}}}

# zim zsh framework

    /usr/bin/env zsh
     zim framework
     https://github.com/Eriner/zim

# define here where are your dotfiles

``` sh
ZDOTDIR=~/.dotfiles/rcfiles/zsh

git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR}/zim

setopt extended_glob
for template_file ( ${ZDOTDIR}/zim/templates/* ); do
    ln -sfvn ${template_file} ~/.${template_file:t}
done
source ${ZDOTDIR:-${HOME}}/.zlogin
```

# Start and ending of paths

    var="/um/caminho/longo/final"
    print ${var:t}
    final

    print ${var:h}
    /um/caminho/longo

    OBS: mnemonic --> t (tail)
                  --> h (head)

# smart cd

    cd ~/projects/sample/src/main/java/com/arun/examples/
    cd java scala

# defining ZDOTDIR
This var is used in many zsh frameworks during git clone

    ZDOTDIR=~/.dotfiles/rcfiles/zsh

# removing only certain dirs

removing all directories except some:

    rm -rf ^(vim-colors-solarized|vim-airline)

# Check the Existence of a Command in Bash and Zsh
[speed test check the existence of a command in bash and zsh](https://www.topbug.net/blog/2016/10/11/speed-test-check-the-existence-of-a-command-in-bash-and-zsh/)

    the fastest way is this (bolean resuld):

    (( $+commands[foobar] ))

# avoiding globbing error while compying files

    setopt extendedglob
    cp some_dir/(^0*).jpg dest_dir/

# list all possible commands using zsh

In zsh, you can list the currently available commands of a given type with echo
${(k)aliases}, echo ${(k)functions}, echo ${(k)builtins} and echo
${(k)commands} (that last one lists external commands only).

     echo ${(k)commands} | sed 's, ,\n,g' | wc -l

# loading zsh clean

    zsh -f

that will start a clean instance of zsh using the
default settings.

You can tell zsh to look for your
configuration files in another folder by setting the parameter ZDOTDIR
to a directory of your choice in your .zshenv file under $HOME:

    ZDOTDIR=/etc/my_kewl_folder/.zshrc

    Generating a log file

    zsh -x 2>&1 | tee zsh.log
    zsh -xv 2>&1 | tee zsh.log

# aliases are cumulative

    alias ls='ls --color=auto'
    alias la='ls -a'

The la alias will behave just as if you typed ls --color=auto –a,
there's no need to type --color=auto again on your definition.

# how delete a history entry

source: stackoverflow

    LC_ALL=C sed -i '/porn/d' $HISTFILE

With setopt HIST_IGNORE_SPACE, you can prepend the above command with a space
character to prevent it from being writting to $HISTFILE.

# create one folder for each file and move it into it

first you have to know something about filename
and file's extensions when it comes to shell script

``` sh
filename="$1"
extension="${filename##*.}"
filename="${filename%.*}"

for i in `ls *`; do
    mkdir ${i%.*}
    mv $i ${i%.*}
done
```

The same thing done using zsh would be like

``` sh
for i in `ls *`; do
    mkdir ${i:r}
    mv $i ${i:r}
done
```

# how get pipestatus
How to get exit status of process that's piped to another

The syntax is:

    command1 | command2
    echo "${PIPESTATUS[@]}"

OR

    command1 | command2
    echo "${PIPESTATUS[0]} ${PIPESTATUS[1]}"

# how to run a secret series of commands
[[source]](http://unix.stackexchange.com/questions/6094/)

    % fc -p
    % secret-command
    % fc -P

# how to show a function definition
reference: http://va.mu/BLEHZ

functions func_name

you can use =command instead $(which command)

# Just found this little gem

    cd old new

    This form of cd replaces all occurences of old in the full path of the
    present directory with new and tries to change the working directory to the
    resulting path.

    For example, if your working directory is /home/larry/code/backrub/server
    and you want to switch to /home/sergei/code/backrub/server, all you need to
    do is:

    cd larry sergei

# zsh buffer stack

    If you type

    ls -L /etc/some_command

    and them press Esc-q to call man ls
    when you exit the manual the last command reapers

    and if you are typing a command and press Esc-h, iven if
    you are in the middle of a typed command, zsh will show you
    the required manual

# how upgrade oh-my-zsh

    Open up Terminal

    Type in '~/.oh-my-zsh', this should change your directory to the zsh directory.
    -Terminal should read: " .oh-my-zsh git:(master) ". If it does, go to step 3.

    Type in "git status" to see that your status is ahead of master.
    -If you're not concerned about the file status changes, you can "stash" those changes by doing step 4.

    Type in "git stash" to save the progress in the git and move the head back to master.
    Done. Now you should be able to upgrade the next time the terminal asks you too.

    now type

    upgrade_oh_my_zsh

    now type

    git stash pop

# fasd tool shortcuts

    fasd is a tools installed in zsh environment

    f foo           # list frecent files matching foo
    a foo bar       # list frecent files and directories matching foo and bar
    f js$           # list frecent files that ends in js
    f -e vim foo    # run vim on the most frecent file matching foo
    mplayer `f bar` # run mplayer on the most frecent file matching bar
    z foo           # cd into the most frecent directory matching foo
    open `sf pdf`   # interactively select a file matching pdf and launch `open`

# aliases para fasd

    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
    alias v='f -e vim'       # open file with vim
    alias o='a -e xdg-open'  # quick opening files with xdg-open#

# changing the shell - alterando o shell padrão

    chsh -s $(which zsh) $(whoami)

# one-liners

# lowcase filenames
make file and directory names lowercase
+ http://onethingwell.org/post/24608988305/zmv

    Uppercase or lowercase filenames

    zmv '*' '${(U)f}'
    zmv '*' '${(L)f}'
    zmv '(*)' '${(L)1}'
    zmv '*' '${(C)f}'   --> (C) capitalize

    An application of modifiers is !:t, which results into the basename of
    the last argument. Very useful when working with URLs, for example.
    You’ll never have to strip the path manually again:

    % wget ftp://ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p330.tar.gz
    % tar xzvf !:t

# this command

    ``` sh
    ls -1 */**/*.sh
    ```

    (.): regular files
    (/): directories
    (*): executables
    (@): symbolic links
    ®,(W),(X),(U): file permissions

    (LX),(L+X),(L-X),(LmX): file size, with X
    in bytes, + for larger than files, – for smaller than files, m can be
    modifier for size (k for KiB, m for MiB) (mX),(m+X),(m-X): matches file
    modified “more than X days ago”. A modifier can be used to express X in
    hours (h), months (M), wweks (W)…

    (u{owner}): a specific file owner
    (f{permission string ala chmod}): a specific file permissions

    # show only directories
    print -l zsh_demo/**/*(/)

    # show only regular files
    print -l zsh_demo/**/*(.)

    # show empty files
    ls -l zsh_demo/**/*(L0)

    # show files greater than 3 KB
    ls -l zsh_demo/**/*(Lk+3)

    # show files modified in the last hour
    print -l zsh_demo/**/*(mh-1)

    # show files modified in the las 40 minutes
    print -l zsh_demo/**/*(mm-40)

    # Show files created in the last 10 minutes
    print -l zsh_demo/**/*(cm-10)

    # sort files from most to least recently modified and show the last 3
    ls -l zsh_demo/**/*(om[1,3])

    print -l **/*(.Lk-1cm-20om[1])
    "File --> ." Less than 1k, created minute -20, show in reverse order the first

# Show today's files

    ls -1 -- *(.m-1)

# is equivalent to:

    find -iname "*.sh" -printf "\n%f"

# list up to 10 files modified in last 24 hrs

    ls -lt **/*~pdf/*(.m0om[1,10])

# to show files created less than one day

    ls -1 *(.m-1)

the option -1 sets one result per line
and the dot '.' alows only regular files
the 'm-1' asks modifications at less than one day

# show files modified in the last hour

    ``` zsh
    ls *(.mh-1) | wc -l

    ls *.*(^mh3)   # all files not 3 hours old
    ```

#  find all files with size larger than 10 megabytes

    ``` zsh
    ls **/*(.Lm+10)
    ```

# find all files you accessed within the last month:

    ``` zsh
    ls **/*(.aM-1)
    ```

# list files not ending with 'o'

    echo *.[^o]

# avoinding files that start with uppercase

    echo [^[:upper:]]*

# files changed in the last hour

    echo *(mh-1)

Nevertheless, you could also check for either

    acced or changed in the last hour
    access ................. (ah-1)
    or creation ............ (ch-1)

    acced or changed in the last minute
    access ................. (am-1)
    or creation ............ (cm-1)

    acced or changed in the last Month
    access ................. (aM-1)
    or creation ............ (cM-1)

    changed at more than 3 weeks (mw+3)
    (Lm+5) —larger than five megabytes.

# Glob qualifiers

	zman () {
		PAGER="less -g -s '+/^       "$1"'" man zshall
	}

    zman qualifiers

    ``` zsh
    ls **/*(.D) ......... regular hidden files D --> dotfiles
    ls **/*(.) .......... regular files
    ls **/*(^.) ......... not regular files
    ls **/*(@) .......... simbolic links
    ls **/*(*) .......... executable files
    ls **/*(rwx) ........ readable writable and executable by user
    ls **/*(m-1) ........ modification time -1 24h
    ls **/*(mm-1) ....... modification minute -1
    ls **/*(M-1) ........ modification time -1 month
    ls **/*(mh-1) ....... modification hour
    ls **/*(a+1) ....... acces more than one day
    ls **/*(aM+1) ....... acces more than one month
    ls **/*(.DmM+12) .... regular files older thant one year
    ls **/*(L+10M) ...... file more than 10M
    ls **/*(*Lk-5) ...... executable files less than 5kb

	exibir todos menos *.md ou *.zwc
    for f in $ZDOTDIR/^(*.zwc|*.md)(.); ls $f
	ls $ZDOTDIR/^(*.zwc|*.md)(.)

	for f in $ZDOTDIR/.*.zwc(.); ls $f

    for f in $ZDOTDIR/.^*.zwc; zcompare $f
	for f in $ZDOTDIR/.^*.zwc; zcompile $f

	Se os scripts estão no $fpath podemos fazer assim:

	autoload -U $ZDOTDIR/functions.d/**/^(*.zwc|*.md)(.:t)

	Estamos excluindo os compilados "zwc e os markdown"
	e indicando apenas o nome dos arquivos
	regulares (.) com apenas a extensão :t

    ```

	``` zsh
		rm *~*.txt(.)
		#  ||     ^^^ Only plain files
		#  ||^^^^^ files ending in ".txt"
		#  | \Except
		#   \Everything

	    ls *(.D) ........... D dotfiles '.' regular files

	    ls -l **/*(.Lm-2mh-1om[1,3])
	    Lm-2 # <2mbs
	    mh-1 # less 1 hr
	    om[1,3] most recent 3
	```

(om) tells the glob to sort the remaining files by their modification date.

Note that the default unit for this qualifier is days, so (m-1) will mean a day
ago or, more precisely, up to 24 hours before the current system time.

# zsh completions for yaourt

http://youtu.be/mCHwb_TD4ng

1) First install aur-git and run sudo aur to build local database.
2) Grab this function I sloppily put together:

# http://pastebin.com/EJrzSh5A

``` sh
-----8<------------------------
#compdef yaourt
typeset -A opt_args

_localaur () { compadd $(ls /var/aur/) ; }
_yaourt() {
'_localaur'
}

_yaourt "$@"

# -----8<------------------------
```

and put it in a directory other then the default functions directory for zsh ( I am using $HOME/.zsh/functions ).

3) Add a directory to your fpath in your .zshrc so as not to conflict with the original completion script for yaourt.

    fpath=( $HOME/.zsh/functions $fpath )

Now tab away and enjoy.

That's it. Thanks for watching.

# use r to repeat the last command - with substituition

``` sh
echo one two
r two=three
one three
```

# print var in lowcase

    echo $var:l

# print file name without extension

    echo $filename:r
    echo $filename:t  (basename)
    echo $filename:h  (dirname)
    echo $filename:r  (extension removed)

# Remove the suffix from each file (*.sh in this example)

    $f:e is $f file extension
    :h --> head (dirname)
    :t --> tail (basename)
    :r --> rest (extension removed)
    $ for f (*.sh) mv $f $f:r

# how set up 'command not found'

    [ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# some funtions

``` sh
shell () {
    ps | grep `echo $$` | awk '{ print $4 }'
}
```

# show only directories

    print -l foldero/**/*(/)

# show only regular files

    print -l foldero/**/*(.)

    changed in last three days
    ls -l */**(.m3)

# show empty files

    ls -l foldero/**/*(L0)

# show files greater than 3 KB

    ls -l foldero/**/*(Lk+3)

# show files modified in the last hour

    print -l foldero/**/*(mh-1)

# shortcut to show or manipulate most recent file
for example

    ls Ctrl-x Ctrl-m

The above shortuc will put the most recent file name in command line

# sort files from most to least recently modified and show the last 3
    ls -l foldero/**/*(om[1,3])

    list the most recent file
    ls -l */**(.om[1])

# vi newest file

    vi *(.om[1])

# show all files with extension .pdf in current directory and all subdirectory

    ls **/*.pdf

# make all files executable (recursively)

    chmod -x **/*(.)

# show all regular files with the word “test” in their name in current directory and all subdirectory

    ls **/*test*(.)

# find all executable files in current directory and all subdirectory

    ls -l **/*(.x)

# find all files of user tomcat

    ls -l **/*(u:tomcat:)

# find all files you accessed within the last month:

    ls **/*(.aM-1)

# find all files with size larger than 10 megabytes

    ls **/*(.Lm+10)

# show only executable files

       ls -l **/*(*)

# tornar executáveis todos os arquivos de um diretório

    o ponto "." é um qualificador que indica arquio

		chmod -x **/*(.)

# You can access zmv's advanced documentation by typing man zshcontrib.
+ http://onethingwell.org/post/24608988305/zmv

    zmv "programmable rename"
    autoload -U zmv

    ``` zsh
    zmv -W '*.md' '*.txt'
    ```

# Recursively changing file extension with zmv
+ http://www.drbunsen.org/batch-file-renaming/
+ https://github.com/johan/zsh/blob/master/Functions/Misc/zmv

To actually perform the file renaming run the command without the -n flag

    ``` zsh
    zmv -n '(**/)(*).txt' '$1$2.rtf'

    zmv -Q '(**/)(*).txt' '$1$2.rtf'

    mv -- other/file001.txt other/file001.rtf
    mv -- other/file002.txt other/file002.rtf
    mv -- other/file003.txt other/file003.rtf
    mv -- other/file004.txt other/file004.rtf
    mv -- other/file005.txt other/file005.rtf
    mv -- other/file006.txt other/file006.rtf
    mv -- other/file007.txt other/file007.rtf
    mv -- other/file008.txt other/file008.rtf
    mv -- other/file009.txt other/file009.rtf
    mv -- other/file010.txt other/file010.rtf
    mv -- file001.txt file001.rtf
    mv -- file002.txt file002.rtf
    mv -- file003.txt file003.rtf
    ```

The -Q flag allows hidden files to be matched along with visible files. Adding
the (**/) code will cause zmv to change the file extension on all .txt files in
the current directory and any text files in any sub-directories (visible or
hidden).

    ``` zsh
    zmv -w '**/*.txt' '$1$2.lis'
    noglob zmv -W **/*.txt **/*.lis
    ```

These are the lazy version of the one above; with -w, zsh inserts the
parentheses for you in the search pattern, and with -W it also inserts
the numbered variables for you in the replacement pattern.

# Remove extension

``` sh
zmv -W '*.html' '*'
```

# rename all files to lowercase

``` sh
zmv -o-i '(**/)(*)' '$1${2:l}'

# lowercase name lowercase extension
zmv '(*.md)' '${(L)1:r}.${(L)1:e}'

# uppercase name lowercase extension
zmv '(**/)(*.mkv)' '$1${(U)2:r}.${(L)2:e}' # recursive traversal
```

# rename txt to rb

    zmv -Wv '*.txt' '*.rb'

# removendo extensão mp4a

    zmv '(*)mp4a' '$f:gs/\.mp4a//'

    with the '-n' option you can only see what will happen
    without actualy changing any file.

    zmv -n (*) ${(U)1}

# in this example we are going to change all to lowercase

    zmv '(*)' '${(L)1}'

    Adding leading zeros to a filename (1.jpg -> 001.jpg)
    zmv '(<1->).jpg' '${(l:3::0:)1}.jpg'

# Replace spaces in filenames with underline

    ``` zsh
    zmv '(*)_(*)' '$1-$2'
    zmv '(*_*)' '${1//_/-}'
    zmv '(* *)' '${1// /}'
    zmv -Q "(**/)(* *)(D)" "\$1\${2// /_}"

Other stuff

    zmv '(*)' '${(U)1}'
    zmv '* *' '$f:gs/ /_'
    zmv  '*' '${f// /}'
    zmv '*' '$f:s/hell/heaven/'

    ```

# Change the suffix from *.sh to *.pl

    zmv -W '*.sh' '*.pl'

# lowercase/uppercase all files/directories

    $ zmv '(*)' '${(L)1}' # lowercase
    $ zmv '(*)' '${(U)1}' # uppercase

# Remove numbers on the filenames begin

    autoload -U zmv
    zmv '[0-9]## #(*.mp3)' '$1'

    In this case we can use [perl-rename](perlrename.md) with regex

