# scp.md -Last Change: qua 01 nov 2017 14:35:14 -03
O comando scp permite copiar arquivos remotamente
sua syntax é simples

	scp origem destino

veja um exemplo em que copiamos arquivos *.jpg para a pasta atual

	scp fulano@172.30.34.5:/home/fulano/*.jpg ./

	scp -rvz -e 'ssh -p 2222' --progress user@server:~/.vimrc .

# copiando pastas remotamente
Neste caso temos que usar o parâmtro 'r' do scp

	scp -r fulano@ip:/pasta /home/backup/
	scp -P 2222 user@remote-host:/home/user/.dotfiles ./

# editando arquivos remotamente

	:e scp://username@someremotehost/./path/to/file

	gvim scp://manager@192.168.1.11/./bashrc

# Para arquivos grandes habilite a compressão

	scp -Cr origem destino

# limitando o consumo de banda

	scp -l10 pippo@serverciccio:/home/zutaniddu/* .

