if status is-interactive

    set -gx EDITOR (which nvim)
    set -gx PATH ~/.local/bin $PATH
    set -gx PATH /usr/local/go/bin $PATH
    set -gx PATH ~/go/bin $PATH
    set -gx PATH /usr/local/nvim-linux64/bin $PATH
    set -gx XDG_CACHE_HOME "$HOME/.cache"
    set -gx XDG_CONFIG_HOME "$HOME/.config"
    set -gx XDG_DATA_HOME "$HOME/.local/share"
    set -gx XDG_STATE_HOME "$HOME/.local/state"

    if wsl
        alias clip "clip.exe"
    else
        alias clip "xclip -selection clipboard"
    end
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

    fish_vi_key_bindings

    # Enable !! and !$
    # https://superuser.com/a/944589
    function bind_bang
        switch (commandline -t)[-1]
            case "!"
                commandline -t -- $history[1]
                commandline -f repaint
            case "*"
                commandline -i !
        end
    end

    function bind_dollar
        switch (commandline -t)[-1]
            case "!"
                commandline -f backward-delete-char history-token-search-backward
            case "*"
                commandline -i '$'
        end
    end

    # TODO: Get this stuff to work.
    # function fish_user_key_bindings
    #     bind ! bind_bang
    #     bind '$' bind_dollar
    # end
    # bind \cK history_search_backward
    # bind \cJ history_search_fowrard
    # bind \cL accept_autosuggestion

    # Init the stuff ###################################################################

    direnv hook fish | source
    starship init fish | source
end
