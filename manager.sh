#!/bin/bash
# Iniciar o Docker Swarm no nó manager
sudo docker swarm init --advertise-addr=10.172.236.100

# Obter o token do worker e criar o script para ser usado nos nós worker
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh

# Criar o volume Docker
sudo docker volume create sharedfiles

# Instalar o servidor NFS
sudo apt install -y nfs-kernel-server

# Adicionar a configuração do NFS para compartilhar o volume
echo "/var/lib/docker/volumes/sharedfiles/_data *(rw,sync,subtree_check)" | sudo tee -a /etc/exports

# Atualizar as exportações do NFS
sudo exportfs -ar

# Reiniciar o serviço NFS depois de modificar (somente se necessário)
# sudo systemctl restart nfs-kernel-server

# Listar as configurações de exportação
exportfs -v
