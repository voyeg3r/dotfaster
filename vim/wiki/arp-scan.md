Captura informações de rede

# Pegar o endereço ip pelo MAC Address

    arp-scan -l | awk '/00:40:a7:0d:cf:fb/ {print $1}'
