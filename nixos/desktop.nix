# Desktop Setup: Compositor, Desktop-Shell, Utils, ...
# Also includes some IO stuff like Kanata, Logitech, fingerprint, ...
{
  pkgs,
  inputs,
  ...
}:
{
  # Desktop
  programs.niri.enable = true;

  # Display Manager
  services.displayManager = {
    autoLogin.user = "tobi";
    sddm = {
      enable = true;
      autoNumlock = true;
      enableHidpi = true;
      wayland.enable = true;
    };
  };

  # Fingerprint Reader
  services.fprintd.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
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
    cava
    cliphist
    flameshot
    fuzzel
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kanata # TODO: move this to services.kanata
    libnotify
    logiops
    networkmanagerapplet
    nextcloud-client
    # nirius
    shikane
    solaar
    swaylock # Not in use, but better to have a fallback.
    uwsm
    wdisplays
    wl-clipboard
    wlsunset
    wshowkeys
    xwayland-satellite
  ];
}
