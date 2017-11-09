# retorna o nome da maquina atual - Last Change: qua 08 nov 2017 16:31:51 -03

    echo "o nome do computador é `hostname`"

# retornar o IP

    hostname --ip-addresses

# Changing hostiname without resarting the system
+ https://askubuntu.com/questions/87665/how-do-i-change-the-hostname-without-a-restart

    sudo hostname newname

	hostnamectl set-hostname 'new-hostname'
	source: https://askubuntu.com/a/704208
