#!/bin/bash

packages=(
  "nodejs"
  "node-gyp"
  "semver"
  "pnpm"
)

# Install required packages
sudo pacman -S --needed ${packages[@]}

# Ensure pnpm global package directory exists + prefix is set
mkdir -p ~/.local/share/pnpm
pnpm config set prefix ~/.local/share/pnpm
export PNPM_HOME=/home/arch/.local/share/pnpm 

# Add global package directory to $PATH
echo 'export PATH="$HOME/.local/share/pnpm:$PATH"' >>~/.bashrc
echo 'export PATH="$HOME/.local/share/pnpm:$PATH"' >>~/.zshrc
