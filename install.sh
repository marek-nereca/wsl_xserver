#!/bin/bash

set -x

username=$(wslvar USERNAME)
cd /mnt/c/users/$username/.ubuntu/

sudo apt-key adv --fetch-keys https://packages.microsoft.com/keys/microsoft.asc
if [[ $(lsb_release -rs) == "18.04" ]]; then
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main" > /etc/apt/sources.list.d/microsoft-prod.list'
else
    if [[ $(lsb_release -rs) == "20.04" ]]; then
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/20.04/prod bionic main" > /etc/apt/sources.list.d/microsoft-prod.list'
    else
       echo "Non-compatible distribution"
       exit 1
    fi
fi
sudo sh -c 'echo "deb [trusted=yes] https://wsl-translinux.arkane-systems.net/apt/ /" > /etc/apt/sources.list.d/wsl-translinux.list'
sudo apt update

sudo apt install -y ubuntu-desktop
sudo apt install -y apt-transport-https
sudo apt install -y dotnet-sdk-3.1
sudo apt install -y systemd-genie
echo "$USER ALL=(ALL) NOPASSWD:/usr/bin/genie" | sudo EDITOR="tee" visudo --file /etc/sudoers.d/$USER
