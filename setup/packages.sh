setup_dir="$(dirname "${BASH_SOURCE[0]:-$0}")"
source "$setup_dir/utility.sh"

install_mac_packages() {
    if ! cmd_exists brew; then
        action_msg "Installing Homebrew..."
        /bin/bash -o "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        brew analytics off
    fi

    brew bundle -v --no-lock --file="$setup_dir/Brewfile"
    brew cleanup
}

action_msg "Installing packages..."

local system="$(system_type)"
if [ "$system" == "mac" ]; then
    install_mac_packages
fi
