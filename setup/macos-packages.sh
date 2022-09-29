#!/usr/bin/env bash

if ! command -v brew &> /dev/null; then
    /bin/bash -o "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew analytics off
fi

brew update

brew install cmake
brew install git
brew install neovim
brew install ripgrep
brew install tmux
brew install trash
brew install tree

brew install --cask appcleaner
brew install --cask bitwarden
brew install --cask iterm2
brew install --cask rectangle

brew cleanup
