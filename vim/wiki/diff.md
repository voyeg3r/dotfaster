# Mostrando as diferenças entre duas árvores de diretórios
Last Change: dom 29 out 2017 11:40:30 -03

				diff <(cd dir1 && find | sort) <(cd dir2 && find | sort)

Outro modo de fazer o mesmo

				diff -urp /originaldirectory /modifieddirectory


				diff -Naur dir1/ dir2/

    The -u option makes the output a little easier to read.
    The -r option recurses through all subdirectories
    The -N and -a options are really only necessary if you wanted to create a patch file.

# Usando substituição de processos

				diff <(echo hello; echo there) <(echo hello; echo world)
				2c2
				< there
				---
				> world

# comparando o conteúdo de duas variáveis

``` bash
diff <(echo "$a") <(echo "$b")
```

# diferenças entre dois comandos

				diff <(tail -10 file1) <(tail -10 file2)

# guardando as diferenças entre dois arquivos

				diff frutas1.txt frutas2.txt > diferenca.001.patch

# aplicando as diferenças "patch"

				patch frutas1.txt < diferenca.001.patch

#Using diff to create a simple patch
+ https://linuxacademy.com/blog/linux/introduction-using-diff-and-patch/
+ http://www.thegeekstuff.com/2014/12/patch-command-examples

The most simple way of using diff is getting the differences between two
files, an original file and an updated file. You could, for example, write a
few words in a normal text file, make some modifications, and then save the
modified content to a second file. Then, you could compare these files with
diff, like this:

    diff originalfile updatedfile

Of course, replace originalfile and updatedfile with the appropiate filenames
of your case. You will most probably get an output like this:

    1c1
    < These are a few words.
    No newline at end of file
    —
    > These still are just a few words.
    No newline at end of file

Creating a patchfile

	diff originalfile updatedfile > patchfile.patch
	patch originalfile -i patchfile.patch -o updatedfile
	patch -i patchfile.patch -o updatedfile

# Referências
* http://www.commandlinefu.com/commands/browse
* http://leonardobighi.com/linux/31/usando-diff-e-patch-pra-agilizar-seu-trabalho

