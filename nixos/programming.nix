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

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      acl
      attr
      bzip2
      curl
      libsodium
      libssh
      libxml2
      openssl
      stdenv.cc.cc
      systemd
      util-linux
      xz
      zlib
      zstd
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
    ast-grep
    ghostscript
    luarocks
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
    lua5_1
    lua-language-server
    stylua

    # Markdown
    markdownlint-cli2

    # Nix
    nil
    nixfmt
    statix

    # Python
    (pkgs.writeShellScriptBin "python" ''
      export LD_BINARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${pkgs.python3}/bin/python "$@"
    '')
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
