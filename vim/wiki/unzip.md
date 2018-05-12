# unzip / zip command - sex 11 mai 2018 19:14:56 -03

    unzip file.zip

    unzip -l file.zip  # lista o conteúdo

# descompactar em um destino

    unzip file.zip -d /caminho/para/o/mesmo/

# How to compress multiple folders, each into its own zip archive?
+ https://stackoverflow.com/a/20452562/2571881

    for i in */; do zip -r "${i%/}.zip" "$i"; done
