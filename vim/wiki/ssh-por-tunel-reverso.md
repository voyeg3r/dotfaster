
# SSH: Criando um túnel reverso
+ http://www.hardware.com.br/dicas/ssh-fazendo-tunel-reverso.html

Diego Giovane Pasqualin criou 27/fev/2007 às 09h44
1

Esta dica visa resolver o problema da impossibilidade de acesso via ssh ao computador de casa quando se tem uma conexão escondida atrás de um NAT (Network Address Translation), ou um firewall. Problema bastante conhecido entre os usuários de internet via rádio.

Dessa maneira, para que você possa concluir esse acesso à sua casa a partir de um notebook (ou de uma lan house), será necessário um computador intermediário que irá conectar-se à sua casa, e ao notebook, estabelecendo então uma ponte entre eles.

Condições para o feito:

- O notebook pode se conectar a porta 10000 (ou qualquer outra, que não esteja em uso) no computador intermediário.

- O micro intermediário deve estar rodando um servidor ssh.

- Você deve ter conta de usuário no intermediário.

- Você pode abrir conexão da sua casa para o intermediário.

Você NÃO precisa ter privilégios de root em nenhuma das máquinas para fazer o proposto!

Vamos ao que interessa.

Primeiramente, na sua casa, abra um terminal e execute o comando abaixo.

(Para facilitar, tomaremos o computador da sua casa como "home", o computador intermediário como "middle" e o computador pelo qual você quer fazer a conexão como "notebook"). Substitua o "usermiddle" pelo seu login na outra máquina e o "middle" pelo endereço IP ou domínio de acesso:

$ ssh -R 10000:localhost:22 usermiddle@middle
(no micro da sua casa)

Este comando cria um túnel entre a porta 10000 do computador intermediário e a 22 da sua casa.

Você deve ter certeza que esta conexão não será fechada por inatividade, para isso você pode acrescentar as seguintes linhas no arquivo "/etc/ssh/sshd_config" do micro da sua casa:

TCPKeepAlive yes
ClientAliveInterval 30
ClientAliveCountMax 99999

Então, quando for se conectar pelo notebook, executar o seguinte comando:

$ ssh userhome@middle -p 10000

Fazendo isso, o intermediário irá redirecionar a conexão para sua casa, e pronto!

Como na prática nem sempre as coisas funcionam tão simples assim, pode acontecer de o computador intermediário estar configurado de maneira a não permitir o redirecionamento ou a conexão direta pela porta 10000, e você não ter privilégios para corrigir isso. Mas não desanime! Ainda há uma maneira, esqueça o último comando digitado e siga os passos a seguir:

$ ssh usermiddle@middle
(a partir do notebook, onde o "usermiddle" e "middle" são o usuário e senha do micro intermediário)

Isso vai abrir um prompt no micro intermediário. Use em seguida o comando:

$ ssh userhome@localhost -p 10000

(Agora use o nome de usuário e senha do micro da sua casa)


Esta dica é baseada no texto "TIP SSH Reverse Tunnel", que pode ser encontrado no wiki do gentoo (http://gentoo-wiki.com/TIP_SSH_Reverse_Tunnel).

Por Diego Giovane Pasqualin. Revisado 27/fev/2007 às 09h44
