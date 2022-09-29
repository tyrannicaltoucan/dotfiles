# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export LSCOLORS="ExGxFxdaCxDaDahbabacec"
    # check for updates once a day (default is 5 minutes)
    export HOMEBREW_AUTO_UPDATE_SECS=86400
    # don't update installed packages when calling 'brew install'
    export HOMEBREW_NO_INSTALL_UPGRADE=1
fi
