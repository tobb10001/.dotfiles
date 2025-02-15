if test -e "$HOME/.cargo/env";
    cat "$HOME/.cargo/env" | babelfish | source;
end

source "$HOME/.local/share/../bin/env.fish"
