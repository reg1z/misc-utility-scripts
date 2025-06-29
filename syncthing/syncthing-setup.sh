#!/bin/bash

SCRIPTS="scripts"
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

sudo pacman -S --needed syncthing

mkdir -p $USER_HOME/.config/systemd
mkdir -p $USER_HOME/.config/systemd/user
sudo cp -f syncthing.service $USER_HOME/.config/systemd/user/syncthing.service

echo -e "You can now enable syncthing as a user:\n"
echo -e "Run:"
echo -e "systemctl --user enable syncthing@$CURRENT_USER"
echo -e "systemctl --user start syncthing@$CURRENT_USER"
