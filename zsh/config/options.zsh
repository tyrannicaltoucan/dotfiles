autoload -Uz compinit && compinit -i

setopt no_case_glob            # use case insensitive globbing
setopt correct                 # enable shell correction
setopt always_to_end           # move the cursor to the end of a completed word
setopt auto_menu               # display menu after successive tab press
setopt prompt_subst            # enable prompt subsitution syntax

setopt share_history           # share history between sessions
setopt append_history          # append to history file
setopt inc_append_history      # add commands to history as they are typed, instead of at shell exit
setopt hist_expire_dups_first  # delete duplicates first
setopt hist_ignore_dups        # don't store duplicates
setopt hist_reduce_blanks      # remove blank lines from history

unsetopt menu_complete         # don't auto-select the first entry
unsetopt flowcontrol           # disable start and stop characters
unsetopt beep                  # disable terminal bells

# History
HISTFILE="$HOME/.zhistory"
HISTSIZE=2000
SAVEHIST=2000

# Completion styling
zstyle ":completion:*" menu select
zstyle ":completion:*" list-dirs-first true
zstyle ":completion:*" matcher-list "" "m:{[:lower:][:upper:]}={[:upper:][:lower:]}" "+l:|=* r:|=*"
