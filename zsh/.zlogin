autoload -Uz zrecompile
for f in ${ZDOTDIR:-${HOME}}/.zcomp^(*.zwc)(.); zrecompile -pq $f

zrecompile -pq ${ZDOTDIR:-${HOME}}/.zshrc
zrecompile -pq ${ZDOTDIR:-${HOME}}/.zlogin
zrecompile -pq ${ZDOTDIR:-${HOME}}/.zshenv


for f in $ZDOTDIR/functions.d/^(*.zwc|*.md)(.); zrecompile -pq $f
