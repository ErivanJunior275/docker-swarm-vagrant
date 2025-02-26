#!/bin/bash

echo "Aguardando o NFS ser configurado..."
sleep 20  # Ajuste o tempo conforme necessário

# sudo ufw status
# sudo ufw allow from 10.172.236.0/24 to any port 2049 proto tcp
# sudo ufw allow from 10.172.236.0/24 to any port 111 proto tcp
# sudo ufw allow from 10.172.236.0/24 to any port 111 proto udp
# sudo ufw allow from 10.172.236.0/24 to any port 20048 proto tcp
# sudo ufw allow from 10.172.236.0/24 to any port 892 proto tcp
# sudo ufw allow from 10.172.236.0/24 to any port 875 proto tcp
# sudo ufw reload

sudo apt install -y nfs-common
# sudo mount -t nfs 10.172.236.100:/var/lib/docker/volumes/sharedfiles/_data /var/lib/docker/volumes/sharedfiles/_data

for i in {1..5}; do
  sudo mount -t nfs 192.168.56.56:/var/lib/docker/volumes/sharedfiles/_data /var/lib/docker/volumes/sharedfiles/_data && break
  echo "Tentando novamente o mount... tentativa $i"
  sleep 15
done
