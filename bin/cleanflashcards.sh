#!/usr/bin/env bash

cp output.csv{,-backup}

sed -i -r 's/<(\/)?(strong|em|br|((p|span|a)[^>]*))(\/)?>//g' output.csv
sed -i -r 's|(<[/]?)(u)(>)|\1b\3|g' output.csv
sed -i -r '/^(\s+|\t)?\(/d' output.csv
sed -i -r '/CLIQUE AQUI/,$d' output.csv
sed -i -r 's/\xE2\x80\xA8//g' output.csv
sed -i -r '/^(\xc2\xa0)?[0-9]+/d' output.csv
sed -i -r '/(<b>|^$)/!d' output.csv

# sed -i -r '/^$/{N;/^\n$/d;}' output.csv
# gawk -i inplace -v RS='\n\n\n' 1 output.csv
