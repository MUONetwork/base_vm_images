#!/usr/bin/env bash

set -eux

apt update -y
# && apt upgrade -y
apt install -y software-properties-common
ver=$(grep -o 'VERSION_ID.*' /etc/os-release | cut -f2- -d= | sed 's/"//g')
if [ "$ver" == "20.04" ] || [ "$ver" == "20.1" ]; then
    # the add apt repository for ansible doesnt work well with Ubuntu 20.04 and not needed on LinuxMint 20.1
    apt install -y python3 python3-pip
    pip3 install ansible==2.10
    echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc
else
    apt-add-repository ppa:ansible/ansible
    apt update -y
    apt install -y ansible
fi
