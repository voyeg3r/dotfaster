# Configurar o Java
+ https://wiki.archlinux.org/index.php/Java_(Portugu%C3%AAs)#Instala.C3.A7.C3.A3o
+ http://www.edivaldobrito.com.br/instalar-java-no-linux-veja-como-fazer-isso-manualmente/

Siga primeiro os passos do link acima, depois instale o jdk como descrito na
próxima sessão.

# Instalar o java (para receita federal)
Obs: escolha a versão da oracle

    yaourt jdk

Despois do java instalado rode os comandos abaixo escolhendo primeiro "status"
pra saber o que temos e depois "set" seguido do java que quer definir como
default

    archlinux-java <COMANDO>

    COMANDO:
        status		Lista ambientes Java instalados e um habilitado
        get		Retorna o nome curto do ambiente Java definido como padrão
        set <JAVA_ENV>	Força <JAVA_ENV> como padrão
        unset		Desconfigura o ambiente Java padrão atual
        fix		Corrige uma configuração inválida/quebrada de ambiente Java padrão




