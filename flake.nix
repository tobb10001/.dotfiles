{
  description = "My development tools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  inputs.unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, unstablepkgs }: {
    defaultPackage.x86_64-linux =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        unstable = import unstablepkgs { system = "x86_64-linux"; };
      in
        pkgs.buildEnv {
          name = "my-dev-env";
          paths =  [
            # Shell
            pkgs.direnv
            pkgs.eza
            pkgs.fish
            pkgs.starship
            pkgs.zoxide

            # Neovim
            unstable.neovim
            pkgs.luarocks
            pkgs.xclip
            # Language Servers
            # pkgs.clang-tools
            # pkgs.ltex-ls
            pkgs.ast-grep
            unstable.gopls
            pkgs.harper
            pkgs.haskell-language-server
            pkgs.lua-language-server
            pkgs.mermaid-cli
            pkgs.tectonic
            pkgs.tinymist
            pkgs.yaml-language-server
            # Debuggers
            unstable.delve
            pkgs.lldb

            # CLI
            pkgs.bat
            pkgs.borgbackup
            pkgs.btop
            pkgs.delta
            unstable.carapace
            pkgs.exiftool
            pkgs.fd
            pkgs.fzf
            pkgs.gh
            pkgs.ghc
            pkgs.git
            pkgs.git-lfs
            pkgs.go-task
            pkgs.graphviz
            pkgs.grc
            pkgs.imagemagick
            pkgs.jq
            pkgs.lazygit
            pkgs.parallel-full
            pkgs.ripgrep
            pkgs.stow
            pkgs.tldr
            pkgs.translate-shell
            unstable.typst
            pkgs.watchexec
            pkgs.yamllint
            pkgs.yq
            unstable.zola

            # Keyboard
            pkgs.kanata

            # Graphical
            pkgs.zotero
          ];
        };
  };
}
