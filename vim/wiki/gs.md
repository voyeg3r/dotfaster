# Ghostscript
Juntar dois arquivos PostScript ou PDF Você pode juntar arquivos PostScript ou PDF.

    gs -q -dNOPAUSE -dBATCH -sDEVICE=pswrite \
    -sOutputFile=bla.ps -f foo1.ps foo2.ps

    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite \
    -sOutputFile=bla.pdf -f foo1.pdf foo2.pdf

Whithout any compressing

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress \
    -sOutputFile=out.pdf in1.pdf in2.pdf
