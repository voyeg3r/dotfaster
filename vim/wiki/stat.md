# stat.md intro - Last Change: asdfa

display file or file system status

# Get file creation date

		stat -c %y file | awk '{print $1}'

