# All things programming.
{
  pkgs,
  unstable,
  ...
}:
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # Shell
    direnv
    eza
    fzf
    starship
    zoxide

    # Shell
    direnv
    eza
    fzf
    starship
    zoxide

    # Neovim
    unstable.neovim
    # Lazyvim Deps
    luarocks
    ast-grep
    mermaid-cli
    sqlite # Zotcite
    tectonic
    tree-sitter

    harper

    # Language Support
    # Elixir
    elixir
    beamMinimal28Packages.elixir-ls

    # Go
    gcc # Apparently needed for Go sometimes? ("net")
    go
    golangci-lint
    gofumpt
    gopls

    # Latex
    texlab

    # Lua
    stylua

    # Markdown
    markdownlint-cli2

    # Nix
    nil
    nixfmt
    statix

    # Python
    python3
    ruff
    ty
    uv

    # Rust
    cargo
    cargo-insta
    rust-analyzer
    rustc
    rustfmt

    # Typst
    tinymist

    # YAML
    yaml-language-server

    # CLI
    bat
    borgbackup
    btop
    delta
    exiftool
    fd
    file
    graphviz
    grc
    gum
    imagemagick
    jless
    jq
    lazygit
    parallel-full
    pandoc
    pciutils
    ripgrep
    stow
    go-task
    tldr
    translate-shell
    unstable.typst
    usbutils
    unstable.zola
    watchexec
    yq
    zip
  ];
}
