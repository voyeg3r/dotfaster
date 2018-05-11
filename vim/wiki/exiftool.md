# exiftool - edit images and images metadata - sex 11 mai 2018 15:26:43 -03
+ https://hvdwolf.github.io/pyExifToolGUI/

## Substitui palavras-chave existentes por duas novas palavras chaves.

    exiftool -keywords=palavra1 -keywords=palavra2 foto.jpg

# Remove all metadata from a file:

    exiftool -all= -overwrite_original "file name.extension"

# Remove all metadata from the current directory:

    exiftool -all= -overwrite_original .

# Remove all metadata from all png files in the working directory:

    exiftool -all= -overwrite_original -ext png .
