#!/bin/bash

set -x

username=$(wslvar USERNAME)
cd /mnt/c/users/$username/.ubuntu/

sudo apt-key adv --fetch-keys https://packages.microsoft.com/keys/microsoft.asc
sudo apt update

sudo apt install -y apt-transport-https
sudo wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg
sudo chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg

if [[ $(lsb_release -rs) == "18.04" ]]; then
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main" > /etc/apt/sources.list.d/microsoft-prod.list'
    sudo sh -c 'echo "deb https://arkane-systems.github.io/wsl-transdebian/apt/ bionic main
    deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ bionic main" > /etc/apt/sources.list.d/wsl-transdebian.list'
else
    if [[ $(lsb_release -rs) == "20.04" ]]; then
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/20.04/prod focal main" > /etc/apt/sources.list.d/microsoft-prod.list'
        sudo sh -c 'echo "deb https://arkane-systems.github.io/wsl-transdebian/apt/ focal main
        deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ focal main" > /etc/apt/sources.list.d/wsl-transdebian.list'
    else
       echo "Non-compatible distribution"
       exit 1
    fi
fi

sudo apt update
sudo apt install -y ubuntu-desktop
sudo apt install -y dotnet-sdk-5.0
sudo apt install -y systemd-genie
echo "$USER ALL=(ALL) NOPASSWD:/usr/bin/genie" | sudo EDITOR="tee" visudo --file /etc/sudoers.d/$USER
