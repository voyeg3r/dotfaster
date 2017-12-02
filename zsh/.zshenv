# avoid global loading environmente settings
unsetopt GLOBAL_RCS

export TERM="xterm-256color"

export ZDOTDIR="$HOME/.dotfiles/zsh"
export ZSH_CACHE_DIR="$HOME/.zsh-cache.d"

[[ -d "$ZSH_CACHE_DIR" ]] || mkdir "$ZSH_CACHE_DIR"

export EDITOR=vim

export LANG="pt_BR.UTF-8"
export LANGUAGE="pt_BR:pt:pt_PT"
export LC_ALL="pt_BR.UTF-8"

export PYTHONSTARTUP=$HOME/.pythonstartup

export MOZ_DISABLE_PANGO=1

CDPATH=.:..:~:~/docs/:~/img:~/.dotfiles/bin:~/tmp



#path=( $path /home/sergio/.gem/ruby/2.4.0/bin )
path=( ~/.dotfiles/bin /home/sergio/.gem/ruby/2.4.0/bin /usr/bin/core_perl $path )
#fpath=( ~/.dotfiles/zsh/functions.d/ $fpath )


