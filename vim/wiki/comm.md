# comm.md Introdução

o comando comm compara arquivos (ordenados) sorted files

How can I get all lines that are: in both of two files (set intersection) or in
only one of two files (set subtraction).

Use the comm(1) command.

# intersection of file1 and file2

    comm -12 <(sort file1) <(sort file2)

## I have two strings in two different sentences:
+ https://unix.stackexchange.com/a/127240/3157

    string 1: 30 mutation alanine for valine

    string 2: alanine at position 30

is there away to find the similarities between them as it is clear they both have 30 and alanine using regular expressions for example?

    comm -12 <(sed 's/ /\n/g' <<<$str1 | sort) <(sed 's/ /\n/g' <<<$str2 | sort )

    30
    alanine

Explanation

The comm command compares files. With the -1 and -2 flags, it will print those
lines that are found in both files.

`sed 's/ /\n/g' <<<$str1 | sort` : This simply replaces all spaces with newlines in $str1, printing to standard output which is then passed through sort because comm needs its input files to be sorted. For more on the `<<<$var` format, see Bash: Here Strings.

The `<(command)` format is called process substitution, more on that here.

# subtraction of file1 from file2

    comm -13 <(sort file1) <(sort file2)

# lines that are in file1 that not are in file2

    comm -23 <(sort name-that-i-have.txt) <(sort nome-sige.txt)


