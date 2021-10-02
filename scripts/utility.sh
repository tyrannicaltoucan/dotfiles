#!/usr/bin/env bash

action_msg () {
    echo "$(tput bold)>> $(tput setaf 6)$@$(tput sgr0)"
}

is_installed() {
    command -v "$1" >/dev/null
}
