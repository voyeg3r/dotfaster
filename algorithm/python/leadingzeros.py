#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  leadingzeros.py
#         Created:  2018 mai 22 19:47
#     Last Change:  2018 mai 22 19:55
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import sys

data = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.readlines()

for item in data:
    output = int(item)
    print(f'{output:03}')
