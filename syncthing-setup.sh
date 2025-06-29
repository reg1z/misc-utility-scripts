#!/bin/bash

CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

sudo pacman -S syncthing
