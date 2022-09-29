#!/usr/bin/env bash

sudo apt remove --purge -y \
    aisleriot \
    gnome-mahjongg \
    gnome-mines \
    gnome-power-manager \
    gnome-startup-applications \
    gnome-sudoku \
    gnome-todo \
    remmina \
    usb-creator-gtk

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    clangd \
    clang-format \
    cmake \
    curl \
    git \
    ninja-build \
    shellcheck \
    trash-cli \
    tree \
    valgrind \
    zsh

sudo apt autoremove -y

killall snap-store
sudo snap refresh
