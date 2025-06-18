#!/bin/bash

# This script is intended for debian systems.
# It will install all necessary prerequisites and set up
# a containerized instance of Penpot,
# a popular UI/UX design tool and open source figma alternative.
#
# - You can find official penpot docker installation instructions at: https://community.penpot.app/t/self-hosting-penpot-ii/2337
# - And other details in the relevant documentation: https://help.penpot.app/technical-guide/getting-started/docker/

# --------------------------------------------------
# Docker Installation (from Docker's own apt repo)
# --------------------------------------------------

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

# Install latest version of docker engine
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
