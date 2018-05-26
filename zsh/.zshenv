# avoid global loading environmente settings
unsetopt GLOBAL_RCS
skip_global_compinit=1


export TERM="xterm-256color"

export ZDOTDIR="$HOME/.dotfiles/zsh"
export ZSH_CACHE_DIR="$HOME/.zsh-cache.d"
export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump"

[[ -d "$ZSH_CACHE_DIR" ]] || mkdir "$ZSH_CACHE_DIR"

export EDITOR=nvim
export BROWSER=firefox
# export GIT_PAGER="vim - -R -c 'set foldmethod=syntax"

export LANG="pt_BR.UTF-8"
export LANGUAGE="pt_BR:pt:pt_PT"
export LC_ALL="pt_BR.UTF-8"

# export PYTHONSTARTUP=$HOME/.pythonstartup
export PYTHONSTARTUP=$HOME/.dotfiles/python/pythonrc.py
export PYTHONDONTWRITEBYTECODE=1
export MOZ_DISABLE_PANGO=1

export TERM=xterm-256color

# export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER="nvim -u NORC '+set background=dark' '+set ft=man' -"

export PYTHONSTARTUP="$HOME/.dotfiles/python/pythonstartup-new"

CDPATH=.:..:~:~/docs/:~/img:~/.dotfiles/bin:~/tmp

XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"

#path=( $path /home/sergio/.gem/ruby/2.4.0/bin )
path=( ~/.dotfiles/bin /home/sergio/.gem/ruby/2.4.0/bin /usr/bin/core_perl $path )
fpath=( ~/.dotfiles/zsh/functions.d/ $fpath )


