# shuf - Last Change: 2018 mai 21 20:50
Created: qui 14/set/2017 hs 11:49

# Mostrar uma linha aleatória de um arquivo

    shuf -n1 file.txt

    mplayer $(ls -a ~/Music/**/*.mp3 | shuf)
    ls **/*.mp3 | shuf -n 1 | sed 's/.*/"&"/g' | xargs mpg123

    gsettings set org.gnome.desktop.background picture-uri file://`ls ~/img/new-wallpapers/* | shuf | tail -1`

    ls ~/pictures/new-wallpapers | shuf -n1

# Generating random numbers in a range
+ https://stackoverflow.com/a/2556282/2571881

    shuf -i 2000-65000 -n 1
    shuf -i 1-100 -n 1
