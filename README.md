# Intro

This is my brand new attempt to improve zsh performance by
using some cool solutions like:

OBS: this repo also contains my vim configuration including a bunch
of plugins (a big vimwiki with many linux and vim tips)

+ https://github.com/xcv58/prezto/tree/master/modules/lazy-load
+ https://raw.githubusercontent.com/Eriner/zim/master/templates/zlogin

I have an article at Medium.com about this project:
+ https://medium.com/@voyeg3r/holy-grail-of-zsh-performance-a56b3d72265d

### My current time results

	for i in {1..10}; time zsh -ci exit
	zsh -ci exit  0,03s user 0,03s system 74% cpu 0,081 total
	zsh -ci exit  0,03s user 0,03s system 73% cpu 0,082 total
	zsh -ci exit  0,06s user 0,00s system 75% cpu 0,079 total
	zsh -ci exit  0,05s user 0,01s system 76% cpu 0,079 total
	zsh -ci exit  0,02s user 0,04s system 74% cpu 0,081 total
	zsh -ci exit  0,06s user 0,00s system 74% cpu 0,081 total
	zsh -ci exit  0,04s user 0,02s system 74% cpu 0,081 total
	zsh -ci exit  0,01s user 0,05s system 72% cpu 0,083 total
	zsh -ci exit  0,06s user 0,00s system 74% cpu 0,080 total
	zsh -ci exit  0,03s user 0,03s system 74% cpu 0,080 total

### Clonig this repo

	``` sh
	# http version
	git fetch --recurse-submodules --jobs=4 https://github.com/voyeg3r/dotfaster.git

	# ssh version
	git fetch --recurse-submodules --jobs=4 git@github.com:voyeg3r/dotfaster.git
	```

