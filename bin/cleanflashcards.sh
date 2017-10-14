#!/usr/bin/env bash

sed -i -r '/^[0-9]+ –/d' output.csv
sed -i -r 's/<(\/)?(strong|em|br|((p|span|a)[^>]*))(\/)?>//g' output.csv
sed -i -r 's|(<[/]?)(u)(>)|\1b\3|g' output.csv
sed -i -r '/^(\s+|\t)?\(/d' output.csv
sed -i -r '/CLIQUE AQUI/,$d' output.csv
sed -i -r 's/\xE2\x80\xA8//g' output.csv
