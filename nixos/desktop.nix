# Desktop Setup: Compositor, Desktop-Shell, Utils, ...
# Also includes some IO stuff like Kanata, Logitech, fingerprint, ...
{
  pkgs,
  inputs,
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
  services.fprintd.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
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

  # Packages
  environment.systemPackages = with pkgs; [
    bananaCursor
    cava
    (catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
    cliphist
    drawio
    flameshot
    fuzzel
    grim
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kanata # TODO: move this to services.kanata
    libnotify
    logiops
    mimeo
    nautilus
    networkmanagerapplet
    nextcloud-client
    # nirius
    pdfannots2json # Obsidian Zotero Integration
    shikane
    slurp
    solaar
    swappy
    swaylock # Not in use, but better to have a fallback.
    tesseract # Obsidian Zotero Integration
    uwsm
    wdisplays
    wl-clipboard
    wlsunset
    wshowkeys
    xwayland-satellite
  ];
}
