# aria2c.md - Last Change: 2018 mai 15 10:55
``` markdown
Created:	 qua 11 jan 2017 12:55:47 BRT
```

# Introdução
O programa aria2 suporta vários protocolos

* ftp
* http
* torrents
* metalink

# sobre metalink
"Metalink é um padrão aberto que engloba as várias maneiras (FTP/HTTP/P2P)
de baixar arquivos em determinado formato com downloads mais fáceis.

# baixar de dois links simultaneamente

    aria2c http://a/f.iso ftp://b/f.iso

# arquivo de configuração

    ``` markdown
    $HOME/.aria2/aria2.conf

    # this is a comment
    file-allocation=none
    max-upload-limit=50K
    remote-time=true
    all-proxy=http://user:pass@proxy:8888
    ```

# Baixar em paralelo (padrão 5 links)

    aria2c -s 6 http://download.gnome.org/binaries/win32/evince/2.30/evince-2.30.0.msi

    aria2c -x 6 -s 6 link

To document -x, --max-connection-per-server=NUM The maximum number of connections to one server for each download. Possible Values: 1-16 Default: 1 and -s, --split=N Download a file using N connections. If more than N URIs are given

# continuar donwload

    aria2c -c link

# baixar metalink

    aria2c [OPÇÕES] -M [arquivo.metalink]

# baixar de uma lista

    aria2c -i uris.txt

# limitando a largura de banda

    aria2c --max-download-limit=100K http://host/file

# range de links

    aria2c -P http://{host1,host2,host3}/file.iso
    aria2c -Z -P http://host/image[000-100].png

# destino do download

    sudo aria2c -c http://link/file.iso -d /root/isos/

# fazendo um upgrade de forma rápida

    sudo apt-get -y --print-uris upgrade | egrep -o -e "http://[^\']+" | \
    sudo aria2c -c -d /var/cache/apt/archives -i -; sudo aptitude safe-upgrade

# Referências
* http://ubuntuforum-br.org/index.php?topic=43052.0
* http://sourceforge.net/apps/trac/aria2/wiki/UsageExample
* http://www.humbug.in/2010/fast-parallel-downloadingupgrading-for-ubuntu-using-aptitudeapt-getaria2c/
* http://pt.wikipedia.org/wiki/Metalink referência sobre metalink na wikipedia
* http://sourceforge.net/apps/trac/aria2/wiki/FAQ
* http://planet.sabayon.org/?m=200804
