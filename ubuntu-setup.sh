#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "docker could not be found, installing..."

    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io    
fi

if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose could not be found, installing..."

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose
fi

echo ""
echo ""

docker --version
docker-compose --version
