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

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.tobi = {
    extraGroups = [
      "podman"
    ];
  };

  environment.systemPackages = with pkgs; [
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
    ltex-ls-plus # Because harper doesn't support LaTeX??

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
    lua-language-server

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

    # TCL
    tclint

    # Typst
    tinymist

    # YAML
    yaml-language-server

    # Speech
    praat

    # CLI
    bat
    borgbackup
    btop
    delta
    distrobox
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
    libqalculate
    parallel-full
    pandoc
    pciutils
    progress
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
