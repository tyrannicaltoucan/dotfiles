#!/usr/bin/env bash

info_message() {
    printf "$(tput bold)$(tput setaf 6)$@$(tput sgr0)\n"
}

error_message() {
    printf "$(tput bold)$(tput setaf 1)error: $@$(tput sgr0)\n"
}

link() {
    printf "$(tput setaf 2)$1$(tput sgr0) → $(tput setaf 2)$2$(tput sgr0)\n"
    ln -snf "$1" "$2"
}

installed() {
    if command -v "$1" >/dev/null; then
        return 0
    else
        return 1
    fi
}
