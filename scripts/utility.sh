#!/usr/bin/env bash

info_message() {
    printf "$(tput bold)$(tput setaf 6)$@$(tput sgr0)\n"
}

installed() {
    if command -v "$1" >/dev/null; then
        return 0
    else
        return 1
    fi
}
