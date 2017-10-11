# how to use BeautifulSoup
+ Documentation:
+ https://beautiful-soup-4.readthedocs.io/en/latest/
+ https://www.crummy.com/software/BeautifulSoup/bs4/doc/
+ https://www.dataquest.io/blog/web-scraping-tutorial-python/
+ https://programminghistorian.org/lessons/intro-to-beautiful-soup

It is highly recomended to install 'requests' and 'pandas'

    sudo pip install pandas
    sudo pip install requests

``` python
from bs4 import BeautifulSoup
import requests

url = input("Digite o link da página: ")
# page = requests.get('https://www.dataquest.io/blog/web-scraping-tutorial-python/')

# when the website does not allow command line access
headers = {'User-Agent': 'Mozilla/5.0'}

page = requests.get(url, headers=headers)
soup = BeautifulSoup(page.content, 'html.parser')

# print all page links
for link in soup.find_all("a"):
    print(link.get("href"))
```

This lib allows us to extract information from a html file or url

# First example
+ source: https://stackoverflow.com/a/40257326/2571881

``` python
import requests
from bs4 import BeautifulSoup

# when the website does not allow command line access
headers = {'User-Agent': 'Mozilla/5.0'}

# url = "https://linkedin.com/company/1005"
url = 'http://www.mairovergara.com/belong-to-o-que-significa-este-phrasal-verb/'

r = requests.get(url, headers=headers)
print(r.text)

soup = BeautifulSoup(r.text, 'html.parser')
print(soup.prettify())
```

Another example:

``` python
from urllib.request import urlopen, Request
import urllib.request

url = "http://www.mairovergara.com/belong-to-o-que-significa-este-phrasal-verb/"
with urlopen(Request(url, headers={'User-Agent': 'Mozilla'})) as site:
    s = site.read()

#I'm guessing this would output the html source code?
print(s)
```

A third example →  https://chrisalbon.com/python/beautiful_soup_html_basics.html

``` python
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

for tag in soup.findAll('p'):
    print(tag.text, "\n")
```
# Python BeautifulSoup give multiple tags to findAll
+ https://stackoverflow.com/a/20649408/2571881

		tags = soup.find_all(['p', 'strong'])

#  Remove a tag using BeautifulSoup but keep its contents
+ https://stackoverflow.com/a/8439761/2571881

``` python
html = "<p>Good, <b>bad</b>, and <i>ug<b>l</b><u>y</u></i></p>"
invalid_tags = ['b', 'i', 'u']
soup = BeautifulSoup(html)
for tag in invalid_tags:
    for match in soup.findAll(tag):
        match.replaceWithChildren()
print(soup)
```
