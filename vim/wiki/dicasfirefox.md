# dicasfirefox.md - Last Change: 2017 dez 15 18:51
```
Criado: Ter 04/Jan/2011 hs 20:21
```

# References
+ https://www.maketecheasier.com/speed-up-firefox/


# Set firefor as defult browser

    xdg-mime default firefox.desktop x-scheme-handler/http
    xdg-mime default firefox.desktop x-scheme-handler/https

The above set will create an entry on:

    ~/.config/mimeapps.list

## To know your default broser just type:

    xdg-settings get default-web-browser

# How to access foruns with no login
+ http://www.kerkeberos.net/2009/12/10/visite-qualquer-site-ou-forum-sem-autenticacao/

# How to Make Separate User Profiles in Firefox Quantum
+ https://www.downloadsource.net/how-to-create-multiple-user-profiles-in-firefox-quantum/n/10916/

    about:profiles

# How to install Firefox quantum on debian
+ https://linuxconfig.org/how-to-install-firefox-quantum-on-debian-stretch-linux

Edit the file

    /etc/apt/preferences.d/my_preferences

There are three dependencies that you'll need to pin in addition to Firefox. Set each of them up too.

    Package: firefox
    Pin: release a=unstable
    Pin-Priority: 1001

    Package: libfontconfig1
    Pin: release a=unstable
    Pin-Priority: 1001

    Package: fontconfig-config
    Pin: release a=unstable
    Pin-Priority: 1001

    Package: libnss3
    Pin: release a=unstable
    Pin-Priority: 1001

## Install Firefox
Finally, you're ready to install Firefox. You just need to update Apt, and tell Apt to install Firefox from Sid.

    # apt update
    # apt install -t sid firefox

```
	cat <<EOF> | sudo tee /usr/share/applications/firefox-quantum.desktop
	[Desktop Entry]
	Version=46.0.1
	Encoding=UTF-8
	Name=Mozilla Firefox
	Comment=Navegador Web
	Exec=/opt/firefox-quantum/firefox
	Icon=/opt/firefox-quantum/browser/icons/mozicon128.png
	Type=Application
	Categories=Network
	EOF
```
# Suavização de fontes

		gfx.use_text_smoothing_setting

# Enabling firefox multiprocessing on ubuntu
Disable ubuntu-modifications addon and ...

    browser.tabs.remote.autostart
    true

# Download firefox pt-br
+ https://superuser.com/a/322381

    br.mozdev.org

    sudo tar -jxvf firefox.xx.xx.tar.bz2 -C /opt

    sudo chown -R root:users /opt/firefox

    sudo chmod 750 /opt/firefox

    usermod -a -G users sergio

    sudo ln -sfvn /opt/Firefox/firefox /usr/bin/firefox

    touch /usr/share/applications/firefox.desktop

    touch /usr/share/applications/firefox.desktop

    vim /usr/share/applications/firefox.desktop

``` markdown
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
Comment=Browse the World Wide Web
Type=Application
Terminal=false
Exec=/usr/bin/firefox %U
Icon=/opt/firefox/icons/mozicon128.png
StartupNotify=true
Categories=Network;WebBrowser;
```

# Hide firefox titlebar
+ https://addons.mozilla.org/en-US/firefox/addon/hide-caption-titlebar-plus-sma/
+ https://github.com/chpii/Headerbar
+ https://addons.mozilla.org/en-Us/firefox/addon/gnome-3-updated/
+ https://addons.mozilla.org/en-US/firefox/addon/hide-tab-bar-with-one-tab/

# Change firefox user-agent

    about:config

Create a new string:

    general.useragent.override

The string below will set your firefox to appear like opera 46

    Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.3 Safari/537.36 OPR/46.0.2573.0 (Edition developer)

Restore firefox 54 user-agent

    Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:54.0) Gecko/20100101 Firefox/54.0

Identify as chrome

    Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/58.0.3029.110 Chrome/58.0.3029.110 Safari/537.36

# Suspend firefox inactive tabs
+ https://addons.mozilla.org/en-US/firefox/addon/tab-suspender-tab-unloader/

# Make firefox speak English
[us language pack](https://addons.mozilla.org/en-US/firefox/addon/english-us-language-pack/)
# Select All Text When You Click on the URL Bar
+ https://www.maketecheasier.com/28-coolest-firefox-aboutconfig-tricks/

		browser.urlbar.clickSelectsAll

# clear firefox memory usage

source: http://www.online-tech-tips.com/computer-tips/speed-up-mozilla-firefox/

    about:memory
    about:support

# using Google Data Saver Proxy on firefox
+ https://addons.mozilla.org/en-US/firefox/addon/google_datasaver_for_firefox/

# user.js [[FirefoxUserProfile]]

# fix youtube comments if you have third part cookies bocked

add exceptions for this url's

    plus.googleapis.com
    google.com
    plus.google.com
    apis.google.com
    books.googleusercontent.com

# ativar plugins sob demanda
dentro do about:config

      plugins.click_to_play

# Plugins para o firefox quantum
+ https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/

O plugin acima permite logar em duas contas gmail, por exemplo, ao mesmo tempo
ou seja, muiltilogin

    curl -O

'疘疤疤疠番畟畟疓疔疞畞疜疕疟疘畞疙疟畟疙疝疑疗疕疣畟疒疑疓疛疥疠疣畟疒疑疣疕疏疪疕疢疟畕畢畠疓疟疠疩畟疙疝疑疗疕疏疌疋畡畝畣畠畩疌疍畞疚疠疗'

# Developer toolbar
+ http://www.hongkiat.com/blog/firefox-graphical-command-line/

    shift + f2

# desabilitar a checagem de virus
http://en.kioskea.net/faq/1686-optimize-firefox-completely

  Launch Firefox
  In the address bar, type about:config

  Confirm if needed
  In the filter, type safe
  In the Settings list, double-click on the following parameters and set them to false:

  browser.safebrowsing.enabled

  browser.safebrowsing.malware.enabled
  Close Firefox and wait several seconds

  In your Firefox profile, delete the file urlclassifier3.sqlite
  This poses no long-term risk - Firefox can recreate it if required
  Restart Firefox
  You should see an improvement

  browser.download.manager.scanWhenDone

# Carregar abas sob demanda apenas

coloque a chave

  browser.sessionstore.restore_pinned_tabs_on_demand

com valor true

# channels firefox
http://www.mozilla.org/en-US/firefox/channel/#beta

# Reduce the amount of RAM Firefox uses for it’s cache feature
source: http://gnoted.com/3-hacks-for-firefox-double-internet-browsing-speed/

Here’s how to do it:
1. Type “about:config” (no quotes) in the adress bar in the browser.
2. Find “browser.sessionhistory.max_total_viewer”
3. Set it’s value to “0“;(Zero)

# Como instalar o plugin flash via rede local

    scp root@192.168.1.74:/usr/lib/mozilla/plugins/libflashplayer.so /usr/lib/mozilla/plugins

Você pode baixar o plugin no site da adobe e colocar o arquivo
libflashplayer.so na pasta:

      /usr/lib/share/mozilla/plugins/

# como impedir o plugin flash de capturar cookies

    for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done

# Plugins que uso no firefox

  Feedly ...... plugin que gera um novo layout para as notícias do google reader
  e twitter: https://addons.mozilla.org/pt-BR/firefox/addon/feedly/

  F1 .......... Extensão que permite compartilhar notícias direto por e-mail, twitter
  https://addons.mozilla.org/pt-br/firefox/addon/f1-by-mozilla-labs/

  It's all text ... com essa estensão consigo editar o wikispaces com o vim
  hControl+Shift+Alt+Rttp://va.mu/Xhz0

  Turn on your pdf reader ......... pdfjs.disabled

# firefox cache in RAM

criar a seguinte chave (string) através do about:config

    browser.cache.disk.parent_directory

coloque o valor para /var/shm/firefox-cache

# http cache resource

The Mozilla team is working on a number of performance tweaks for upcoming
versions of Firefox, one of which is the use of a new HTTP cache that should
fix some UI hang issues. It isn't enabled by default yet, but will be soon—and
you can enable it right now with an about:config tweak. To do so:

      browser.cache.use_new_backend

Change its value from 0 to 1 to enable the new cache.

    network.dnsCacheEntries;500

Find `network.dnsCacheEntries` and change its value to from 20 to 512.
Find `network.dnsCacheExpiration` and change its value from 60 to 3600.
If your ISP doesnâ€™t support `IPv6`, you can disable it. To do this just find network.dns.disableIPv6 and change it default value to True.
Find `network.http.max-connections` and increase maximum number of simultaneous connections to 48 or 96.
Find `network.http.max-persistent-connections-per-server` and increase maximum persistent connections per server from default 6 to 12
Find `network.http.max-connections-per-server` and increase maximum connections per server from default 15 to 24

# Fix https issue
+ http://gizmodo.uol.com.br/https-ataque-homografico/

Escreva `about:config` na barra de endereços e pressione Enter; Escreva
`Punycode` na barra de pesquisa; As configurações do navegador irão exibir o
parâmetro network.IDN_show_punycode, dê dois cliques e selecione a chave que
muda o valor de `false` para `true`.

http://pt.wikihow.com/Fazer-o-Firefox-Carregar-as-P%C3%A1ginas-de-Forma-Mais-R%C3%A1pida

also enable this:
https://raw.githubusercontent.com/voyeg3r/dotfiles/master/bin/sysctrl.conf

# New tab opening home page
+ [New tab homepage addon](https://addons.mozilla.org/en-US/firefox/addon/777)

# open searches in new tab

By default, Firefox has a search box in the upper-right hand corner from which
you can Google things with ease. When you type in a search term, it opens the
results in your current tab, which is annoying if you want to keep your current
tab open.

To change this behavior, open about:config and search for:

  browser.search.openintab

# Preview Tabs in the Ctrl+Tab Switcher

      browser.ctrlTab.previews

