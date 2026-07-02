# Desktop Setup: Compositor, Desktop-Shell, Utils, ...
# Also includes some IO stuff like Kanata, Logitech, fingerprint, ...
{
  pkgs,
  inputs,
  unstable,
  ...
}:
let
  bananaCursor = import ./banana-cursor-dreams.nix { inherit pkgs; };
in
{
  # Desktop
  programs.niri.enable = true;

  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
      enableHidpi = true;
      wayland.enable = true;
      theme = "catppuccin-mocha-mauve";
    };
  };

  # Fingerprint Reader
  services.fprintd.enable = false;
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
    mime = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "text/html" = "zen.desktop";
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/about" = "zen.desktop";
        "x-scheme-handler/unknown" = "zen.desktop";
      };
    };
  };

  # Kanata
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  users.groups.uinput = { };

  # Logitech
  hardware.logitech.wireless.enable = true;

  # Background services
  security.polkit.enable = true;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.gnome.evolution-data-server.enable = true;

  services.syncthing = {
    enable = true;
    group = "users";
    user = "tobi";
    dataDir = "/home/tobi/";
    configDir = "/home/tobi/.config/syncthing";
  };

  # Other programs that are NixOS modules.
  programs.wireshark.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    bananaCursor
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
    cliphist
    # easyeffects
    # evince
    fuzzel
    grim
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kanata # TODO: move this to services.kanata
    libnotify
    logiops
    mimeo
    networkmanagerapplet
    nextcloud-client
    unstable.nirius
    # obs-studio
    # kdePackages.okular
    pdfannots2json # Obsidian Zotero Integration
    pdfpc
    satty
    shikane
    signal-desktop
    slurp
    # solaar
    swaylock # Not in use, but better to have a fallback.
    # tcl
    # tclPackages.tk
    # tesseract # Obsidian Zotero Integration
    uwsm
    vlc
    wdisplays
    # wireshark
    wl-clipboard
    wlsunset
    xwayland-satellite
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
