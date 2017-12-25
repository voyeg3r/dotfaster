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

	```sh
	# http version
	git clone --recursive -j8 https://github.com/voyeg3r/dotfaster.git .dotfiles
	git fetch --recurse-submodules --jobs=8
    ssh -T git@github.com
    var=`echo 3gmail.com@ | sed 's,\(^3\)\(gmail\.com\)\(\@\),voyeg\1r\3\2,g'`
    git config --global user.name voyeg3r
    git config --global merge.tool vimdiff
    git config --global user.email ${var}
    git config --global alias.last 'log -1 HEAD'
    git config --global credential.helper cache
    git config --global push.default simple
    git config --global credential.helper 'cache --timeout=3600'
    git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

    ln -sfvn ~/.dotfiles/nvim ~/.config/nvim
    ln -sfvn ~/.dotfiles/zsh/.zlogin ~/.zlogin
    ln -sfvn ~/.dotfiles/zsh/.zshenv ~/.zshenv
    ln -sfvn ~/.dotfiles/zsh/.zshrc ~/.zshrc

	chsh -s $(which zsh) $(whoami)

    in case of vim I had to do
    git submodule foreach git pull origin master

	```

