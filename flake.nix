{
  description = "My development tools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
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
            unstable.nushell
            pkgs.starship
            pkgs.zoxide

            # Neovim
            unstable.neovim
            pkgs.xclip
            # Language Servers
            # pkgs.clang-tools
            pkgs.ltex-ls
            pkgs.lua-language-server
            pkgs.nil
            pkgs.nixd
            pkgs.nodePackages.bash-language-server
            pkgs.nodePackages.prettier
            pkgs.stylua
            # pkgs.texlab
            pkgs.yaml-language-server

            # CLI
            pkgs.bat
            pkgs.borgbackup
            pkgs.btop
            pkgs.delta
            pkgs.exiftool
            pkgs.fd
            pkgs.fzf
            pkgs.gh
            pkgs.glab
            pkgs.git
            pkgs.git-lfs
            pkgs.go-task
            pkgs.graphviz
            pkgs.grc
            pkgs.imagemagick
            pkgs.just
            pkgs.jq
            pkgs.k9s
            pkgs.parallel-full
            pkgs.ripgrep
            pkgs.stow
            pkgs.tldr
            pkgs.translate-shell
            pkgs.watchexec
            pkgs.yamllint
            pkgs.yq

            # Keyboard
            pkgs.kanata
          ];
        };
  };
}
