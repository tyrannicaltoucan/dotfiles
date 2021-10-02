#!/usr/bin/env bash

action_msg () {
    echo "$(tput bold)>> $(tput setaf 6)$@$(tput sgr0)"
}

is_installed() {
    command -v "$1" >/dev/null
}

system_type() {
    local system=""
    local kernel=""

    kernel="$(uname -s)"
    if [ "$kernel" == "Darwin" ]; then
        system="mac"
    elif [ "$kernel" == "Linux" ] && is_installed "lsb_release"; then
        system="$(lsb_release -is | tr '[:upper:]' '[:lower:]')"
    else
        system="unknown"
    fi

    echo "$system"
}
