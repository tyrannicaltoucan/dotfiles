if [[ "$os_type" == "darwin" ]]; then
    alias ls="command ls -G"
elif [[ "$os_type" == "linux" ]]; then
    alias ls="command ls -v --color=auto --group-directories-first"
fi

alias la="ls -A"
alias ll="ls -lAoh"
alias mvi="mv -i"
alias rmi="rm -i"
alias vim="command nvim"
alias tree="command tree -C --dirsfirst"
alias td="tree -d"
alias rg="command rg --smart-case"
alias reload="exec ${SHELL} -l"
alias up="cd .."

newdir() {
    mkdir -p "$1" && cd "$1"
}

man() {
    LESS_TERMCAP_md=$'\e[01;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;35m' \
    command man "$@"
}

compress() {
    tar -czf "$1.tar.gz" "$2"
}

extract() {
    tar -xvzf "$1"
    rm -i "$1"
}

download() {
    if [ -e "$HOME/Downloads" ]; then
        pushd "$HOME/Downloads"
    else
        pushd "/tmp"
    fi

    local url="$1"
    local filename="${url##/*}"
    wget "$url" -o "$filename"

    popd
}
