# trash-cli.md - Last Change: 2018 jan 16 18:18
+ https://github.com/andreafrancia/trash-cli

Command line interface to the freedesktop.org trashcan.

Add alias `rm=trash` to your `.zshrc/.bashrc` to reduce typing & safely trash
files: `rm unicorn.png`.

## Usage

    Trash a file:

    trash-put foo

## List trashed files:

``` markdown
$ trash-list
2008-06-01 10:30:48 /home/andrea/bar
2008-06-02 21:50:41 /home/andrea/bar
2008-06-23 21:50:49 /home/andrea/foo
```

## Search for a file in the trashcan:

``` markdown
$ trash-list | grep foo
2007-08-30 12:36:00 /home/andrea/foo
2007-08-30 12:39:41 /home/andrea/foo
```

## Restore a trashed file:

``` markdown
$ trash-restore
0 2007-08-30 12:36:00 /home/andrea/foo
1 2007-08-30 12:39:41 /home/andrea/bar
2 2007-08-30 12:39:41 /home/andrea/bar2
3 2007-08-30 12:39:41 /home/andrea/foo2
4 2007-08-30 12:39:41 /home/andrea/foo
What file to restore [0..4]: 4
$ ls foo
foo
```

## Remove all files from the trashcan:

    trash-empty

## Remove only the files that have been deleted more than <days> ago:

    trash-empty <days>

## Example:

``` markdown
$ date
Tue Feb 19 20:26:52 CET 2008
$ trash-list
2008-02-19 20:11:34 /home/einar/today
2008-02-18 20:11:34 /home/einar/yesterday
2008-02-10 20:11:34 /home/einar/last_week
$ trash-empty 7
$ trash-list
2008-02-19 20:11:34 /home/einar/today
2008-02-18 20:11:34 /home/einar/yesterday
$ trash-empty 1
$ trash-list
2008-02-19 20:11:34 /home/einar/today
```

## Remove only files matching a pattern:

    trash-rm \*.o


