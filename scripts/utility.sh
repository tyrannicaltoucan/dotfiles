#!/usr/bin/env bash

action_msg () {
    echo "$(tput bold)>> $(tput setaf 6)$@$(tput sgr0)"
}

is_installed() {
    command -v "$1" >/dev/null
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
