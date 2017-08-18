setopt EXTENDED_GLOB
autoload -Uz compinit
autoload -Uz zrecompile
if [[ -n $ZSH_COMPDUMP(#qN.mh+24) ]]; then
	compinit -i d $ZSH_COMPDUMP
	zrecompile $ZSH_COMPDUMP
else
	compinit -C
fi

source ~/.dotfiles/zsh/aliases
source ${DOTFILES}/bin/fasd
for f in $ZDOTDIR/functions.d/^(*.zwc)(.); source $f

bindkey '^ ' autosuggest-accept

# User configuration
# export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt NO_BEEP

setopt COMPLETE_ALIASES # complete aliases before executing
setopt NO_FLOW_CONTROL # deactvates XOFF
setopt INTERACTIVE_COMMENTS # allow inline comments like this one
setopt HIST_VERIFY
setopt PROMPT_BANG # enables '!' substituition on prompt
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt complete_in_word

autoload -Uz select-word-style
select-word-style bash

# If you end up using a directory as argument,
# this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

# HISTORY
HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.zsh_history

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

# emacs mode
bindkey -e

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

# function prepend-sudo {
#   if [[ "$BUFFER" != su(do|)\ * ]]; then
#     BUFFER="sudo $BUFFER"
#     (( CURSOR += 5 ))
#   fi
# }
# zle -N prepend-sudo
# bindkey '^Xs' prepend-sudo

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
bindkey '^X ' magic-space            # control-space to bypass completion
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

