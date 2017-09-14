``` markdown
Arquivo: shuf.md
Created: qui 14/set/2017 hs 11:49
Last Change: qui 14 set 2017 11:50:10 -03
```
### Mostrar uma linha aleatória de um arquivo

    shuf -n1 file.txt

    mplayer $(ls -a ~/Music/**/*.mp3 | shuf)

    gsettings set org.gnome.desktop.background picture-uri file://`ls ~/img/new-wallpapers/* | shuf | tail -1`

    ls ~/pictures/new-wallpapers | shuf -n1

### Generating random numbers in a range
+ https://stackoverflow.com/a/2556282/2571881

    shuf -i 2000-65000 -n 1
