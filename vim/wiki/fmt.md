# What is the fmt command in UNIX?

The fmt is a simple text formatter that can set the column
width for a file, files or standard input and write it to
standard output. It supports setting the with of columns
for the formatting, preserving first line indentation,
and setting uniform spacing. Originally designed as a tool
to format mail messages it can be useful for reading files
in the terminal and ad-hoc formatting requirements.


# How to enforce uniform spacing

To enforce uniform spacing using the fmt command the -u
option may be used. This enforces one space between words
and two after sentences.

    echo 'this  has different    spaces' | fmt -u this
    has different spaces

# Controling line size

    fmt -w 60 file.txt
