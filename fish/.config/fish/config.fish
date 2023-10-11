if status is-interactive

    set PATH ~/.local/bin $PATH
    
    alias lslsls="echo Yeah, I don\'t know either..."

    direnv hook fish | source
    starship init fish | source
end
