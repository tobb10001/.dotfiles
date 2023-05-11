# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH="$GOBIN:$HOME/.pyenv:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/home/tobi/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	colored-man-pages
	vi-mode
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ********************************* User Configuration *********************************

# Find out wether we're in WSL.
export WSL=$(test -n "$WSL_DISTRO_NAME")

# Pager, Editor, ...
if which bat &>/dev/null; then
    PAGER="bat --plain --pager 'less -F'"
elif which batcat &>/dev/null; then
    PAGER="batcat --plain --pager 'less -F'" 
fi

export EDITOR=$(which nvim)

# Aliases
if ! which bat &>/dev/null; then
    alias bat="batcat"
fi

# WSL dependent
if [ -n "$WSL" ]; then
    alias clip="clip.exe"
else
    alias clip="xclip -selection clipboard"
fi
# Some don't work in WSL, but I don't bother too much...
alias gradlew="./gradlew"
alias lslsls="echo Yeah, I don\'t know either..."
alias open="xdg-open"
alias pip="pip --require-virtualenv"
alias view="$(which nvim) -R"
alias watch="watch --color"

jp () {
    current=$(pwd)
    autojump $0 > /dev/null
    pwd
    cd $current
}

ziptree () {
    if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
        echo "usage: $0 archive[.zip]";
        return;
    fi
    zipinfo -1 $1 | tree --fromfile .
}

# keybindings
bindkey '^xe' edit-command-line

# set umask
umask 022

# ******************************* End User Configuration *******************************


# activate aactivator
eval "$(aactivator init)"


[[ -s /home/tobi/.autojump/etc/profile.d/autojump.sh ]] && source /home/tobi/.autojump/etc/profile.d/autojump.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

LOCAL_ZSHRC="$HOME/.zshrc.local"
if [ -f "$LOCAL_ZSHRC" ]; then
    source $LOCAL_ZSHRC
fi

