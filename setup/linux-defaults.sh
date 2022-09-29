#!/usr/bin/env bash

if [[ "$XDG_CURRENT_DESKTOP" =~ ^(ubuntu:)?GNOME$ ]]; then
    # UI settings
    gsettings set org.gnome.desktop.interface clock-format "12h"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    gsettings set org.gnome.desktop.interface enable-hot-corners false
    gsettings set org.gnome.mutter center-new-windows true
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3050

    # Remove old caches and trash files after 30 days
    gsettings set org.gnome.desktop.privacy recent-files-max-age 30
    gsettings set org.gnome.desktop.privacy remove-old-temp-files true
    gsettings set org.gnome.desktop.privacy remove-old-trash-files true

    # Miscellaneous settings
    gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
    gsettings set org.gnome.nm-applet disable-connected-notifications true
    gsettings set org.gnome.nm-applet disable-disconnected-notifications true

    echo "Adjusted GNOME settings"
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    sudo usermod -s "$(which zsh)" "$USER"
    echo "Changed default shell to ZSH"
fi
