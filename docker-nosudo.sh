#!/bin/bash

$THIS_USER=$(whoami)

sudo groupadd docker
sudo usermod -aG docker $THIS_USER

mkdir -p /home/$THIS_USER/.docker
sudo chown "$THIS_USER":"$THIS_USER" /home/"$THIS_USER"/.docker -R
sudo chmod g+rwx "/home/$THIS_USER/.docker" -R

# Enable docker/containerd to auto-start after boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Success. You might need to restart your machine or logout to be able to run docker without sudo."
