# weechat.md - Last Change: 2018 jan 13 07:07
+ https://hugo.md/post/the-perfect-weechat-setup-2/

WeeChat is a fast, light and extensible chat client. It runs on many platforms
like Linux, Unix, BSD, GNU Hurd, Mac OS X and Windows (Bash/Ubuntu and Cygwin).

Para ter essa informação sobre determinado nick, use o seguinte comando:

    /msg nickserv info nick_a_consultar
    /nick nick_desejado

Depois disso, para registrar, basta usar o seguinte comando:

    /msg nickserv register senha_desejada e-mail_para_registro

IMPORTANTE! Não deixe de colocar uma senha segura e um e-mail válido. O
provedor vai enviar uma mensagem para você com um comando para validar o
registro. Esse comando terá uma validade de 24 horas, e passado esse tempo, o
nick que tentou registrar estará disponível novamente para qualquer pessoa.

Ok! Pode verificar o e-mail que lá terá uma mensagem com o comando que tem de
usar para ativar realmente o registro.

Pronto... Tem uma determinada opção que é interessante de você usar. Quando
registra o apelido, você tem de usar um e-mail válido, e esse endereço pode
ficar público para qualquer um verificar (a partir do comando de informação
visto acima). Você pode deixar ele escondido, com o comando:

    /msg nickserver set hidemail on


As configurações do server, canais, nick e senha são feitos no arquivo irc.conf na parte [server-default]. A configuração é bem simples, logo:

    nvim /home/user/.weechat/irc.conf

Faça as seguintes alterações:

``` markdown
[server_default]
addresses = “irc.freenode.net”
autoconnect = on
autojoin = “#neovim,#archlinux-br,#linuxlife
nicks = "vimaddicted"
password = “coloque aqui a sua senha”
realname = “seu nome”
username = “seu nick”
```

Além disso no arquivo irc.conf também podem ser feitas várias outras
configurações como por exemplo a edição das cores do programa.

Por fim vamos modificar a aparência do Weechat para que os canais sejam
listados no canto esquerdo da tela.

Primeiramente verifique se dentro do diretório `/home/user/.weechat/perl` tem uma
pasta com o nome autoload, se não tiver crie-a:

    mkdir /home/user/.weechat/perl/autoload

Feito isso abra um arquivo texto em branco e cole o conteúdo desse link dentro dele.

Salve o arquivo na pasta autoload com o nome `buffers.pl` e pronto.

Agora é só chamar o Weechat pelo terminal e usar!

Dicas:

Para alternar entre os canais basta usar a combinação de teclas alt+ “nº correspondente ao canal”.

    /close = Fecha o canal ;

    /query nickdoamigo = Abre pvt;

    /quit = Fecha o Weechat;

    /help = Para ajuda;

    /clear = Limpa a tela atual;

    /clear –all = Limpa as telas de todos os canais;

/uptime -o = Mostra o uptime do Weechat em forma de mensagem aos outros usuários;

    Page UP/DOWN = Rola o histórico do chat

Obs.: Só consegui utilizar e configurar esse excelente programa graças as dicas
do meu grande amigo e Debian-user Daniel.

Grande abraço a todos e espero que gostem!
