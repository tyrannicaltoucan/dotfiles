#!/usr/bin/env bash

print_info() {
    echo "$(tput bold)>> $(tput setaf 6)$*$(tput sgr0)"
}

print_error() {
    echo "$(tput bold)$(tput setaf 1)error: $(tput sgr0)$*" >&2
}

is_installed() {
    command -v "$1" >/dev/null
}

create_link() {
    if [ -L "$2" ] && [ -e "$2" ]; then
        echo "Symlink '$2' already exists!"
    else
        echo "$1 → $2"
        ln -sn "$1" "$2"
    fi
}

system_type() {
    local system="unknown"
    if [ "$(uname -s)" == "Darwin" ]; then
        system="macos"
    elif [ -f "/etc/debian_version" ]; then
        system="debian"
    fi

    echo "$system"
}
