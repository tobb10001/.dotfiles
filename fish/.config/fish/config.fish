if status is-interactive

    set -gx PATH ~/.local/bin $PATH
    set -gx PATH /usr/local/go/bin $PATH
    set -gx PATH ~/go/bin $PATH
    set -gx PATH ~/.nix-profile/bin/ $PATH
    set -gx XDG_CACHE_HOME "$HOME/.cache"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
    set -gx XDG_STATE_HOME "$HOME/.local/state"

    if wsl
        alias clip "clip.exe"
    else
        alias clip "xclip -selection clipboard"
    end
    alias diff "diff -W (tput cols)"
    if command -v eza > /dev/null;
        alias ls "eza --icons"
    else
        alias ls "ls --color=auto"
    end
    if command -v grc > /dev/null;
        alias go "grc go"
    end
    alias lslsls "echo Yeah, I don\'t know either..."
    alias open "xdg-open"
    alias pip "pip --require-virtualenv"
    alias view "nvim -R"
    alias watch "watch --color"

    set LOCAL_CONFIG $XDG_CONFIG_HOME/fish/local.fish
    if test -f $LOCAL_CONFIG
        source $LOCAL_CONFIG
    end
    
    # Keybinds #########################################################################

    fish_default_key_bindings

    # Init the stuff ###################################################################

    direnv hook fish | source
    starship init fish | source
    zoxide init --cmd cd --hook prompt fish | source

    # Be friends with home manager #####################################################
    cat $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh | babelfish | source
end
