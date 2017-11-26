# lsmod.md - Last Change: 2017 nov 26 09:29
Leia estes artigos:
+ http://ivanix.wordpress.com/2009/07/12/comandos-para-gerenciar-modulos-no-linux/
+ http://ubuntued.info/2008/04/como-desligar-os-bips-do-ubuntu.html
+ https://www.cyberciti.biz/faq/linux-show-the-status-of-modules-driver/

# Listar os módules ativos do kernel

    lsmod

# Carregar um módulo

    modprobe <nome>

# Get more information about the driver

To get more information about specific driver use modinfo command. The syntax is:

    modinfo {driver-name}

To see information about a Linux Kernel module called e1000, enter:
    modinfo e1000

Veja também o comando [[rmmod]]

