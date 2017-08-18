# avoid global loading environmente settings
unsetopt GLOBAL_RCS

export TERM="xterm-256color"

export DOTFILES="${HOME}/.dotfiles"
export ZSH_CONFIG="${DOTFILES}/zsh"
export ZDOTDIR="${DOTFILES}/zsh"
export ZSH_CACHE_DIR="$HOME/.zsh-cache.d"
export ZPLUG_HOME="${HOME}/.dotfiles/zsh/zplug"

[[ -d "$ZSH_CACHE_DIR" ]] || mkdir "$ZSH_CACHE_DIR"

export EDITOR=vim

export LANG="pt_BR.UTF-8"
export LANGUAGE="pt_BR:pt:pt_PT"
export LC_ALL="pt_BR.UTF-8"

