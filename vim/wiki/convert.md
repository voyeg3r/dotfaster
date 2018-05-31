# Introdução - dom 01 abr 2018 10:56:02 -03

    convert velha_imagem.png nova_imagem.jpg

    Convert images to a multi-page pdf (necessita imagemagick instalado)

    convert -adjoin -page A4 *.jpeg multipage.pdf

Add a dropshadow to the image.

    convert input.png \
        ( +clone -background black -shadow 75x2+2+2 ) \
        +swap -background white -layers merge +repage -chop 2x2 output.png

# Resize images

    convert myfigure.png -resize 200x100 myfigure.jpg

    convert -resize 50% myfigure.png myfigure.jpg

## converter jpg to png

    for i in *.jpg; do convert "$i" "${i%.jpg}.png" && rm "$i" && echo "$i is converted."; done

## converter todas as páginas de um pdf para png

    convert arquivo.pdf img.png

Para importar páginas individualmente use o inkscape ele lhe permite desagrupar todos os objetos
