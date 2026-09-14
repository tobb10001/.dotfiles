# Graphical Applications
{
  lib,
  config,
  pkgs,
  unstable,
  ...
}:
{
  services.blueman.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  environment.systemPackages = with pkgs; [
    anki
    chromium
    drawio
    ente-auth
    ghostty
    kdePackages.gwenview
    nautilus
    obsidian
    spotify
    wezterm
    zathura
  ];
}
