# plowshare.md - Last Change: 2018 mai 24 08:37

References:
+ http://blog.gypsydave5.com/2016/02/04/xargs-and-curl/
+ https://support.mfscripts.com/public/kb_view/34/

```
command-line downloader and uploader for rapidshare, mediafire and other
file sharing websites.
site: https://github.com/mcrapet/plowshare
```

# instalation

    yaourt -S plowshare && plowmod --install
    sudo pacman -S parallel curl

    $ cat file-with-list-of-urls.txt | parallel curl -L {} -o {/}

which passes the original URL to the {} and then removes the
path from it with the {/}. There's plenty more you can do with
parallels - take a look at the tutorial.

No meu caso eu tive que manipular a lista de arquivos
com o vim e depois rodar um comando do curl

    $ nohup cat filelist | xargs -n4 curl -L &>output &

Nohup protects the process from being interrupted by the
session closing. So it'll keep on going even when you close
your terminal or SSH connection. Don't worry, you can still
kill it if you've made a mistake.

# Geting file list to download

    plowlist -R url > list.txt

    plowdow -m list.txt

# megatools to access mega.nz

    yaourt megatools

    [Login]
    Username = your-email
    Password = your-password

    megareg      Register and verify a new mega account
    megadf       Show your cloud storage space usage/quota
    megals       List all remote files
    megamkdir    Create remote directory
    megarm       Remove remote file or directory
    megaput      Upload individual files
    megaget      Download individual files
    megadl       Download file from a "public" Mega link (doesn't require login)
    megastream   Streaming download of a file (can be used to preview videos or music)
    megacopy     Upload or download a directory tree
    megafs       Mount remote filesystem locally.

tags: mediafire
