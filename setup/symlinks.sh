#!/usr/bin/env bash

# set -eo

source "$(dirname "${BASH_SOURCE[0]:-$0}")/utilities.sh"
print_info "Creating symbolic links..."

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
dotfiles_dir="$(cd "$(dirname "$0")" && pwd -P)"
mkdir -p "$config_dir"

create_link "$dotfiles_dir/nvim" "$config_dir/nvim"
create_link "$dotfiles_dir/tmux" "$config_dir/tmux"
create_link "$dotfiles_dir/zsh/config" "$config_dir/zsh"
create_link "$dotfiles_dir/git/gitconfig" "$HOME/.gitconfig"
create_link "$dotfiles_dir/zsh/zshrc" "$HOME/.zshrc"
