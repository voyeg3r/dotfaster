# .zshrc - Last Change: 2018 fev 03 06:41
# todo: clean bin dir to make load faster

autoload colors && colors
autoload -Uz compinit
autoload -Uz zrecompile
if [[ -n $ZSH_COMPDUMP(#qN.mh+24) ]]; then
	compinit -i d $ZSH_COMPDUMP
	zrecompile $ZSH_COMPDUMP
else
	compinit -C
fi

setopt extended_glob
setopt glob_dots

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '^xe' edit-command-line
bindkey '^T' fzy-file-widget

# Vcs info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%c%{$fg[green]%}%u%{$reset_color%} [%{$fg[blue]%}%b%{$reset_color%}] %{$fg[yellow]%}%s%{$reset_color%}:%r"
precmd() {  # run before each prompt
    vcs_info
}

# Prompt
setopt prompt_subst     # allow funky stuff in prompt
color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;
prompt="%{$fg[$color]%}%n%{$reset_color%}@%U%{$fg[yellow]%}%m%{$reset_color%}%u %T %B%~%b "
RPROMPT='${vim_mode} ${vcs_info_msg_0_}'

# for f in $ZDOTDIR/plugins/**/*.plugin.zsh; source $f

source ~/.dotfiles/zsh/aliases
source ~/.dotfiles/bin/fasd
source .dotfiles/zsh/themes/xxf/xxf.zsh-theme

for f in $ZDOTDIR/functions.d/^(*.zwc)(.); source $f

eval "$(fasd --init auto zsh-hook)"

bindkey '^ ' autosuggest-accept
bindkey "\e[3~" delete-char

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# User configuration
# export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"
setopt autocd
setopt hist_ignore_dups
setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt no_beep

setopt complete_aliases # complete aliases before executing
setopt no_flow_control # deactvates xoff
setopt interactive_comments # allow inline comments like this one
setopt hist_verify
setopt prompt_bang # enables '!' substituition on prompt
setopt inc_append_history
setopt share_history
setopt complete_in_word
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end

autoload -Uz select-word-style
select-word-style bash

# HISTORY
HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.zsh_history

# If you end up using a directory as argument,
# this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# Rehash when completing commands
zstyle ":completion:*:commands" rehash 1

# Process completion shows all processes with colors
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command 'ps -A -o pid,user,cmd'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# List all processes for killall
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# And if you want the number of errors allowed by _approximate to
# increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' \
    max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:*:cd:*' ignored-patterns '(*/|)(CVS|SCCS)'
zstyle ':completion::*:(cvs-add|less|rm|vi):*' ignore-line true
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*:functions' ignored-patterns '_*'

# completions made case insensitive
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
#zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

#zstyle ':completion:::::' completer _complete _prefix
#zstyle ':completion::prefix:::' completer _complete
zstyle ':completion::*:::' completer _complete _prefix

zstyle ':completion:*:warnings' format 'Too bad there is nothing'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# current_wallpaper=$(gsettings get org.gnome.desktop.background picture-uri | sed 's,file:///,/,g' )

bindkey -e                      # emacs keybindings
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '\e[3~'   delete-char             # Del
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
bindkey '^A'      beginning-of-line       # Home
bindkey '^D'      delete-char             # Del
bindkey '^E'      end-of-line             # End
bindkey '^R'      history-incremental-pattern-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '^xe' edit-command-line

bindkey '^b' push-line-or-edit
bindkey '\eb' push-line-or-edit

# getting git status
function _git-status {
    zle kill-whole-line
    zle -U "git status"
    zle accept-line
}
zle -N _git-status
bindkey '\eg' _git-status

# http://jcarreras.es/dotfiles/zsh.html?v1
# function up_directory() {
#   BUFFER="cd .."
#     zle accept-line
# }
# # Define a widget called "up_directory", mapped to our function above.
# zle -N up_directory
# # Bind it to ESC-u // Alt-u
# bindkey "^[u" up_directory

function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
bindkey "^k" up_widget

# history search
# see: http://stackoverflow.com/questions/14040351/filtering-zsh-history-by-command
# function exists { which $1 &> /dev/null }
#
# if exists percol; then
#      function percol_select_history() {
#          local tac
#          exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
#          BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
#          CURSOR=$#BUFFER         # move cursor
#          zle -R -c               # refresh
#      }
#
#      zle -N percol_select_history
#      bindkey '^R' percol_select_history
# fi

# # define widget function
# function cursor-after-first-word {
#     zle up-history
#     zle beginning-of-line
#     zle forward-word
#     RBUFFER=" $RBUFFER"
# }
# create widget from function
#zle -N cursor-after-first-word
# bind widget to ESC-o
#bindkey '^[o' cursor-after-first-word

# Inserts 'sudo ' at the beginning of the line.
stty ixany

# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

function prepend-sudo {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo
bindkey '^Xs' prepend-sudo

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# source: http://goo.gl/HUXBjG
globalias() {
    if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle self-insert
}
zle -N globalias

bindkey ' ' globalias                # expande aliases globais
#bindkey '^X ' magic-space            # control-space to bypass completion
#bindkey -M isearch " " magic-space  # normal space during searches
#bindkey -s '\eu' 'cd ..^j' # alt-u up dir

# source: http://stackoverflow.com/questions/171563/whats-in-your-zshrc
# I often build elaborate commands step by step: I run a command,
# see I need a different option, then use the output of the same
# command within # $() (the portable version of backquotes) in a
# for loop or something. The following snippet makes alt-E (I
# should probably write meta-E?) insert the previous line
# between $().

# quote pasted URLs
# it seems kind of uncompatible with substring-search
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# in order to install auto-suggestions plugin
# https://github.com/zsh-users/zsh-autosuggestions
# this key binding must be here at the end because of something I dont know yet
bindkey '^ ' autosuggest-accept

bindkey '^X^A' fasd-complete
bindkey '^X^F' fasd-complete-f
bindkey '^X^D' fasd-complete-d

# rationalize dot by Mikael Magnusson (Mikachu)
function rationalise-dot {
    local MATCH # keep the regex match from leaking to the environment
    if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
        LBUFFER+=/
        zle self-insert
        zle self-insert
    else
        zle self-insert
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert

# search for a term in the history commands
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '' history-beginning-search-menu

source $ZDOTDIR/plugins/fzy/fzy.plugin.zsh
source $ZDOTDIR/plugins/zsh-autopair/zsh-autopair.plugin.zsh
source $ZDOTDIR/plugins/extract/extract.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Use Ctrl-x,Ctrl-l to get the output of the last command
zmodload -i zsh/parameter
insert-last-command-output() {
    LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
