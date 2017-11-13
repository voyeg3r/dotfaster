# ip.md - Last Change: 2017 nov 13 08:05

O ip é utilizado para atribuir endereços IP para as interfaces de rede,
mostrar configuração do TCP/IP, entre outras coisas.

O comando abaixo mostra as rotas ativas

# adicionar rota

    ip route add to 0.0.0.0/0 via 192.168.1.1
    ip route show

    ip addr show

# Mostrar o gateway padrão

    ip route list | awk '/default/ {print $3}'

# identificar placas de rede

		ip link show

# Show ip address

    ip address | awk '/global/ {print $2}'
    192.168.0.122/24

# if you don't have network configurated try

		ip link

		ip link set "interface" up
		dhcpd "interface"
