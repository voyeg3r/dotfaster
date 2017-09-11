autoload -Uz zrecompile
for f in ${ZDOTDIR:-${HOME}}/.zcomp^(*.zwc)(.); zrecompile $f

zrecompile ${ZDOTDIR:-${HOME}}/.zshrc
zrecompile ${ZDOTDIR:-${HOME}}/.zlogin
zrecompile ${ZDOTDIR:-${HOME}}/.zshenv


for f in $ZDOTDIR/functions.d/^(*.zwc|*.md)(.); zrecompile $f
