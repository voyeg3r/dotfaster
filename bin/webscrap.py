#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         <+Filename Here+>
# Author:       Sergio Araujo
# Last Change:  seg 09 out 2017 18:22:11 -03
# Created:      seg 09 out 2017 18:22:11 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# Import required modules
import requests
from bs4 import BeautifulSoup

# Create a variable with the url
url = input("Digite o link da página: ")
# url = 'http://www.mairovergara.com/catch-on-o-que-significa-este-phrasal-verb/'

headers = {'User-Agent': 'Mozilla/5.0'}

# Use requests to get the contents
r = requests.get(url, headers=headers)

# Get the text of the contents
html_content = r.text

# Convert the html content into a beautiful soup object
soup = BeautifulSoup(html_content, 'html.parser')

# print all links (or a range of them)
# print(soup.find_all('a')[0:5])

# print(soup.find_all('p'))

with open("output.csv", "w") as file:
    for tag in soup.findAll('p'):
        file.write(str(tag.text))
        file.write("\n\n")

#for tag in soup.findAll('p'):
#    print(tag.text, "\n")
