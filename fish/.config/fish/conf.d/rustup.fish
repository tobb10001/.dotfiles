if test -e "$HOME/.cargo/env";
    cat "$HOME/.cargo/env" | babelfish | source;
end
