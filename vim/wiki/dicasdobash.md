# dicas do bash - Last Change: 2017 nov 04 19:09

# Being more concise
Avoid cat when possible

		wc -l /etc/passwd

tr and many other commands accept files

		tr X Y < FILE

# bash onliners

	http://www.bashoneliners.com/?page=1

# Transpose words

	Ctrl-t

# Substituição de processos - process substitution
+ https://giovannireisnunes.wordpress.com/2017/10/20/substituicao-de-processos-no-bash/

				vim <( lspci )

Utilizando a substituição de processos para baixar um arquivo via wget e ao
mesmo tempo compactá-lo com o gzip.

				wget http://ftp.ubuntu.com/ubuntu/dists/yakkety/Release --output-document=>( gzip -c -9 > Release.gz )

				export host='http://ftp.ubuntu.com/ubuntu/dists';\
					vimdiff <( curl ${host}/yakkety/Release ) \
          <( curl ${host}/zesty/Release )

O interessante deste exemplo, além de dispensar a criação de arquivos
temporários, está no fato de que os arquivos são baixados simultaneamente
já que cada curl roda em uma subshell.

Outra situação comum é quado precisamos consultar certa manpage em busca de um
padrão, por exemplo; se queremos saber como impor um limite de download ao
wget podemos consultar a manpage assim:

				grep limit <(man wget)

# How display all possible commands avaiable

source: forun ubuntu https://goo.gl/cJDkp4

    whatis `compgen -c` | less

    This will list all commands and a simple description of each command.

    If you want to save the list you can redirect the result into an output file

    whatis `compgen -c` > listOfCommands.txt

source (stack overflow): https://goo.gl/PYqI2n

    compgen -c will list all the commands you could run.
    compgen -a will list all the aliases you could run.
    compgen -b will list all the built-ins you could run.
    compgen -k will list all the keywords you could run.
    compgen -A function will list all the functions you could run.
    compgen -A function -abck will list all the above in one go.

# how to Renaming files in a folder to sequential numbers

source: http://stackoverflow.com/questions/3211595/

``` sh
a=1
for i in *.jpg; do
    new=$(printf "%04d.jpg" "$a") #04 pad to length of 4
    mv -- "$i" "$new"
    let a=a+1
done
```

another option in one line:

    count='1'; for i in *.jpg; do mv $i $(printf '%04d'.jpg $count); (( count++ )); done

# how get pipestatus

How to get exit status of process that's piped to another

The syntax is:

    command1 | command2
    echo "${PIPESTATUS[@]}"

    OR

    command1 | command2
    echo "${PIPESTATUS[0]} ${PIPESTATUS[1]}"

# catching file name and file extensions

    filename=$(basename "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"


# Inserting DOS carriage return

    simple press Ctrl-v Ctrl-m

# Bash: Read a file into a variable

    value=$(<config.txt)

# pegando os links mp3 de um html

	grep -o 'http://[^"]*'  < test.html  | grep mp3

# como criar um array no bash

``` sh
var=($(uname -a))
echo ${var[0]}
```

#  imprimindo os últimos três elementos de um array

     echo "${SERVERS[@]:(-3)}"

# Atalhos e dicas do terminal de comandos

# Abrindo a pasta atual no gerenciador de arquivos

    xdg-open .

# Dicas do Júlio César Neves

``` sh
read -p "Deseja continuar (s/n)? "

[[ ${REPLY^} == N ]] && exit

# Para capturar qualquer tecla, tipo "pressione qualquer tecla pra continuar faça:"

    read -n 1 -s -p "Press any key to continue"
```


``` sh
function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}
```

Veja também InputRc

Para acessar rapidamente um comando recem digitado basta
pressionar Ctrl-r e digitar parte do comando, o bash achará
o comando, basta então pressionar enter.

    ^176^160 ........ troca 176 por 160 no comando anterior

# Para fechar o terminal direto, mesmo que exista texto digitado

    Ctrl-Shift-q

# Abrir o terminal via teclado

    Ctrl-alt-t

# função para testar se o valor passado é inteiro

``` sh
#!/bin/sh
# Check if input is integer or not

${1:? Usage: No input, exiting..}

result=$(echo $1 | egrep ^[[:digit:]]+$)

if [ "$result" = "" ] ; then
    echo "Not Integer"
else
    echo "Integer"
fi
```

