# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  unstable,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Nix Settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kanata
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  users.groups.uinput = { };

  # Logitech
  hardware.logitech.wireless.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.ipu6 = {
    enable = true;
    platform = "ipu6epmtl";
  };

  networking.hostName = "Tobias-TB16G7"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Iceland/Reykjavik";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tobi = {
    isNormalUser = true;
    description = "Tobi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "uinput"
    ];
    packages = with pkgs; [
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
      gopls

      # Markdown
      markdownlint-cli2

      # Nix
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
      pciutils
      ripgrep
      stow
      go-task
      tldr
      translate-shell
      unstable.typst
      usbutils
      unstable.zola
      yq
      zip

      # Desktop
      anki
      chromium
      # discord
      flameshot
      fuzzel
      kanata
      kdePackages.gwenview
      kdePackages.kdeconnect-kde
      nextcloud-client
      obsidian
      solaar
      zathura
      unstable.zotero

      # Games
      lutris
      wine-staging
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    clang
    fish
    git
    networkmanagerapplet
    unzip
    wezterm
    wget

    # Desktop components
    # Note: Niri is configured through program.niri
    cava
    cliphist
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    libnotify
    logiops
    # nirius
    shikane
    swaylock # Not in use, but better to have a fallback.
    uwsm
    wdisplays
    wl-clipboard
    wlsunset
    wshowkeys
    xwayland-satellite
  ];
  environment.variables = {
    TERM = "wezterm";
  };

  programs.niri.enable = true;
  services.displayManager.autoLogin.user = "tobi";
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    enableHidpi = true;
    wayland.enable = true;
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;
  # flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
