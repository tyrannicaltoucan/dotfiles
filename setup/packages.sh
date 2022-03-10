setup_dir="$(dirname "${BASH_SOURCE[0]:-$0}")"
source "$setup_dir/utilities.sh"

install_mac_packages() {
    if ! cmd_exists brew; then
        print_info "Installing Homebrew..."
        /bin/bash -o "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        brew analytics off
    fi

    brew bundle -v --no-lock --file="$setup_dir/Brewfile"
    brew cleanup
}

install_apt_packages() {
    sudo apt update -y
    sudo apt upgrade -y

    sudo apt install -y \
        build-essential \
        cmake \
        curl \
        gdb \
        git \
        shellcheck \
        tmux \
        trash-cli \
        tree \
        xclip \
        zsh

    sudo apt autoremove -y
}

print_info "Installing packages..."

local system="$(system_type)"
if [ "$system" == "macos" ]; then
    install_mac_packages
elif [ "$system" == "debian" ]; then
    install_apt_packages
fi
