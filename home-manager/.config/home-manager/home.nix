{ pkgs, ... }:
  let
    username = builtins.getEnv "USER";
    homeDirectory =  "/home/" + username;
    unstable = import <unstable> { config = { allowUnfree = true; }; };
  in
assert username != "";
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "24.05";

  home.packages = [
    # Wezterm
    # # Wezterm doesn't work for some reason. We use a workaround using the AppImage,
    # # see home.file.
    # pkgs.wezterm

    # Shell
    pkgs.babelfish
    pkgs.direnv
    pkgs.eza
    pkgs.fish
    unstable.nushell
    unstable.nushellPlugins.gstat
    pkgs.starship
    pkgs.zoxide

    # Programming Tools
    pkgs.nodejs
    pkgs.pandoc
    pkgs.shellcheck
    pkgs.virtualenv

    # Neovim
    unstable.neovim
    # Neovim: Soft dependencies
    pkgs.xclip
    # Neovim: Language Server
    pkgs.clang-tools
    pkgs.ltex-ls
    pkgs.lua-language-server
    pkgs.nil
    pkgs.nixd
    pkgs.yaml-language-server
    pkgs.nodePackages.bash-language-server

    # Emacs
    pkgs.emacs

    # Other lovely CLI tools
    pkgs.bat
    pkgs.btop
    pkgs.commitizen
    pkgs.delta
    pkgs.exiftool
    pkgs.fd
    pkgs.fzf
    unstable.gh
    pkgs.glab
    pkgs.git
    pkgs.glow
    pkgs.go-task
    pkgs.graphviz
    pkgs.nodePackages.prettier
    pkgs.parallel-full
    pkgs.pipx
    pkgs.ripgrep
    pkgs.stow
    pkgs.tldr
    pkgs.translate-shell
    pkgs.watchexec
    pkgs.yq

    # Vision 100% Keyboard
    pkgs.kanata
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Wezterm
    ".local/bin/wezterm" = {
      source = builtins.fetchurl {
        url = "https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage";
        # hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      };
      executable = true;
    };
    ".local/share/applications/wezterm.desktop" = {
      text = ''
        [Desktop Entry]
        Version=1.0
        Type=Application
        Terminal=False
        Exec='' + homeDirectory + ''/.local/bin/wezterm start
        Name=Wezterm
      '';
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tobi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
