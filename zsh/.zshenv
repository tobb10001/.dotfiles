command_exists() {
    if ! command -v $1 >/dev/null; then
	echo $1 WAS NOT FOUND.
    fi
}

# XDG
XDG_CACHE_HOME="$HOME/.cache"
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

# zsh
ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Paths
PATH="$HOME/.local/bin:$PATH"

## Go
GOPATH="$HOME/go"
GOBIN="$GOPATH/bin"
PATH="$GOBIN:$PATH"

## Rust
. "$HOME/.cargo/env"

# Tools

## Pager
command_exists bat
PAGER="$(command -v bat) --plain --pager 'less -F'"

# Editor
command_exists nvim
export EDITOR=$(command -v nvim)

# Find out wether or not we're in WSL.
WSL=$([ -n "$WSL_DISTRO_NAME" ] && echo "WSL")
