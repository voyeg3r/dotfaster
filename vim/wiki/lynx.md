# pegar todos os links de uma página

    lynx -dump http://www.domain.com | awk '/http/{print $2}'

    lynx -dump url > filetext.txt

    lynx -dump -display_charset=utf-8 site | less


# Dump of local file

  lynx --dump ./local-file > final-file

# Changing user-agent

		lynx -useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1"
