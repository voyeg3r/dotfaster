# ripgrep.md intro

ripgrep combines the usability of The Silver Searcher with the raw speed of grep.

To recursively search the current directory, while respecting all .gitignore
files, ignore hidden files and directories and skip binary files:

				rg foobar


To ignore all ignore files, use -u. To additionally search hidden files and
directories, use -uu. To additionally search binary files, use -uuu. (In other
words, "search everything, dammit!") In particular, rg -uuu is similar to `grep -a -r.`

``` bash
rg -uu foobar  # similar to `grep -r`
rg -uuu foobar  # similar to `grep -a -r`
```

Make the search case insensitive with `-i`, invert the search with `-v` or
show the 2 lines before and after every search result with `-C2`


Search only files matching a particular glob:

				rg foo -g 'README.*'

Or exclude files matching a particular glob:

				rg foo -g '!*.min.js'

Search only HTML and CSS files:

				rg -thtml -tcss foobar

Search everything except for Javascript files:

				rg -Tjs foobar


