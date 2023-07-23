# Ensure starship is installed.
if [ ! -x "$HOME/.local/bin/starship" ]; then
    curl -sS https://starship.rs/install.sh | sh /dev/stdin --bin-dir "$HOME/.local/bin"
fi

# Aliases
## Clip
if [ -n "$WSL" ]; then
    alias clip="clip.exe"
else
    command_exists xclip
    alias clip="xclip -selection clipboard"
fi
# lslsls
alias lslsls="echo Yeah, I don\'t know either..."
alias open="xdg-open"
alias pip="pip --require-virtualenv"
if [ ! command -v python 2>/dev/null ]; then
    alias python=python3
fi
alias view="$(command -v nvim) -R"
alias watch="watch --color"

# Functions
. $ZDOTDIR/functions.zsh

# Keybindings
bindkey '^xe' edit-command-line

# Local config
LOCAL_CONFIG=$XDG_CONFIG_HOME/zsh/local.zsh
if [ -f "$LOCAL_CONFIG" ]; then
    source $LOCAL_CONFIG
fi

# Init starship
eval "$(aactivator init)"
eval "$(starship init zsh)"
