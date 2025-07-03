#!/bin/bash

sudo pacman -Syu --noconfirm

# core packages
packages=(
  "gum"
  "git"
  "flatpak"
  "fuse2" # for appimages
  "base-devel"
  "gnome"
  "polkit-gnome"
  "terminator"
  "tmux"
  "vi"
  "vim"
  "neovim"
  "nano"
  "code"
  "unzip"
  "7zip"
  "less"
  "jq"
)

network_packages=(
  "openssh"
  "curl"
  "bind"
  "iproute2"
)

# unzip
