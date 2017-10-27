# cmp.md compare files byte by byte
+ http://www.dicas-l.com.br/cantinhodoshell/cantinhodoshell_20070520.php

suponha que você tenha 2 diretórios: dir e dir.bkp e deseja saber se os dois
estão iguais (aquela velha dúvida: será que meu backup está atualizado?).
Basta comparar os dados dos arquivos dos diretórios com o comando cmp,
fazendo:

``` bash
cmp <(cat dir/*) <(cat dir.bkp/*) || echo backup furado
```

ou, melhor ainda:

``` bash
cmp <(cat dir/*) <(cat dir.bkp/*) >/dev/null || echo backup furado
```
