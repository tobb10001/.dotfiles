{ pkgs, ... }:
  let
    username = builtins.getEnv "USER";
    unstable = import <unstable> { config = { allowUnfree = true; }; };
  in
assert username != "";
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/" + username;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Wezterm
    # # Wezterm doesn't work for some reason. We use a workaround using the AppImage,
    # # see home.file.
    # wezterm
    jetbrains-mono

    # Fish
    babelfish
    direnv
    eza
    fish
    starship
    zoxide

    # Neovim
    unstable.neovim
    # Neovim: Soft dependencies
    xclip
    # Neovim: Language Server
    clang-tools
    lua-language-server
    nil
    nixd
    yaml-language-server

    # Other lovely CLI tools
    bat
    btop
    commitizen
    fd
    fzf
    go-task
    pipx
    ripgrep
    moreutils # sponge
    translate-shell
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
        Exec=~/.local/bin/wezterm start
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
