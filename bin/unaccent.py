#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#         Created:  23-01-2017
#     Last Change:  2018 mai 24 14:30
#    What it does:  Remove accents of a given text
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import unicodedata
import sys

''' Removes accents from a given string

    unaccent.py "Ação, pé, alçapão --> Acao, pe, alcapao"

    echo Ação, pé, alçapão | unaccent.py
    Acao, pe, alcapao
'''

argument = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.read()
argument = ''.join(argument).lower()

def unaccent(text):
    '''
    Removes accents from a givem text
    unacent(text) --> string '''
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    output = output.decode('utf-8')
    return output


print(unaccent(argument))

# if __name__ == '__main__':
#         main()

