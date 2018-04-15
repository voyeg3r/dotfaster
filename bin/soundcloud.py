#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         <+Filename Here+>
# Author:       Sergio Araujo
# Last Change:  dom 15 abr 2018 10:58:12 -03
# Created:      dom 15 abr 2018 10:58:12 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

import requests
import re
import sys

url = sys.argv[-1]
html = requests.get(url)

track_id = re.search(r'soundcloud://sounds:(.+?)"', html.text)

final_page = requests.get("https://api.soundcloud.com/i1/tracks/{0}/streams?client_id=6pDzV3ImgWPohE7UmVQOCCepAaKOgrVL".format(track_id.group(1)))
print(final_page.json()['http_mp3_128_url'])
