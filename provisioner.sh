#!/usr/bin/env bash

# Atualiza lista de pacotes
sudo apt-get update

# Instala pacotes necessários para o Docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Adiciona chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adiciona repositório do Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualiza lista de pacotes
sudo apt-get update

# Instala Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Inicia container com Prometheus
sudo docker run -d --name prometheus -p 9090:9090 -v $(pwd)/prometheus:/etc/prometheus prom/prometheus:v2.28.1
