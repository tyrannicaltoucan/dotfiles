autoload -Uz colors && colors
autoload -Uz vcs_info

precmd() {
    # enable VCS functionality for prompt
    vcs_info

    # customize terminal titles
    print -Pn "\e]2;%n@%m: %c\a" # Window -> user@host: current dir
    print -Pn "\e]1;%c\a"        # Tabs -> current dir
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{magenta}%b'

# show "user@hostname" if the shell is operating from a SSH session
[[ "$SSH_CONNECTION" ]] && local userhost='%F{yellow}%B%n@%M%b%f '
PROMPT='${userhost}%F{blue}%B%c%b %(?.%F{green}.%F{red})» %f'
RPROMPT='%B${vcs_info_msg_0_}%f%b'
