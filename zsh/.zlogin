autoload -Uz zrecompile
#for f in ${ZDOTDIR:-${HOME}}/.zcomp^(*.zwc)(.); zrecompile -pq $f
zrecompile -pq ${ZSH_COMPDUMP}

#for f in ${ZDOTDIR:-${HOME}}/{.zshrc,.zlogin,.zshenv}(#qN.mh+24); zrecompile -p $f
for f in ${ZDOTDIR:-${HOME}}/{.zshrc,.zlogin,.zshenv}; zrecompile -pq $f

for f in $ZDOTDIR/functions.d/^(*.zwc|*.md)(.); zrecompile -pq $f
