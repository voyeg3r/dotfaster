# bash (builtin) lê um arquivo e gera um vetor
+ http://www.dicas-l.com.br/cantinhodoshell/cantinhodoshell_20100121.php

``` bash
$ cat frutas
abacate
maçã
morango
pera
tangerina
uva

$ mapfile vet < frutas  # Mandando frutas para vetor vet
$ echo ${vet[@]}        # Listando todos elementos de vet
abacate maçã morango pera tangerina uva
```

Obteríamos resultado idêntico se fizéssemos:

``` bash
$ vet=($(cat frutas))
```
