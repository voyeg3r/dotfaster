Arquivo: descriação do plugin vim-plug do vim
Criado: Dom 07/Nov/2010 hs 10:05
Last Change: 2018 mai 24 08:35

O plugin vim-plug cria uma pasta única onde se colocam
as pastas dos plugins por inteiro.

Esta era a aboradagem tradicional, nela cada plugin instala
um arquivo em plugin, outro em doc, outro em autoload e assim por diante

     ~/.vim
        |
        +--plugin
        |
        +--doc
        |
        +--autoload

Com o plugin vim-plug cada plugin deve ser
instalado inteiramente na pasta plugged, a única
excessão é o próprio plugin vim-plug que coloca
também um arquivo em autoload, direto na pasta .vim

     ~/.vim
        |
        +--plugged
              |
              +--plugin
              |
              +--doc
              |
              +--autoload

tags: vim, nvim

