if status is-interactive

    set -gx PATH /usr/local/go/bin $PATH
    set -gx PATH ~/.local/bin $PATH
    set -gx PATH ~/.nix-profile/bin/ $PATH
    set -gx PATH ~/.npm-packages/bin $PATH
    set -gx PATH ~/go/bin $PATH
    set -gx PATH ~/swift/swift-6.0.1/usr/bin $PATH
    set -gx PATH ~/.cargo/bin $PATH
    set -gx XDG_CACHE_HOME "$HOME/.cache"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
    set -gx XDG_STATE_HOME "$HOME/.local/state"

    set -x EDITOR nvim
    set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config

    if wsl
        alias clip "clip.exe"
    else if command -v xclip >/dev/null
        alias clip "xclip -selection clipboard"
    else if command -v wl-copy >/dev/null
        alias clip wl-copy
    else
        echo "Neither WSL, nor xclip nor wl-copy found. `clip` alias could not be created."
    end
    alias diff "diff -W (tput cols)"
    if command -v eza >/dev/null

        alias ls "eza --icons"
    else
        alias ls "ls --color=auto"
    end
    if command -v grc >/dev/null

        alias go "grc go"
    end
    alias lslsls "echo Yeah, I don\'t know either..."
    alias lvim "NVIM_APPNAME=lazyvim nvim"
    alias emacs "emacs -nw"
    alias open xdg-open
    alias pip "pip --require-virtualenv"
    alias view "nvim -R"
    alias watch "watch --color"

    set LOCAL_CONFIG $XDG_CONFIG_HOME/fish/local.fish
    if test -f $LOCAL_CONFIG
        source $LOCAL_CONFIG
    end

    # Keybinds #########################################################################

    fish_default_key_bindings

    bind \e\cj history-search-forward
    bind \e\ck history-search-backward

    # Init the stuff ###################################################################

    direnv hook fish | source
    fzf --fish | source
    starship init fish | source
    zoxide init --cmd cd --hook prompt fish | source
end
