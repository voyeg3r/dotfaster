# stat.md intro - Last Change: 2017 nov 05 18:51

display file or file system status

# Get file creation date

		stat -c '%y' file | awk '{print $1}'

# Display octal permissions of a given file

		stat -c '%a' /etc/passwd

