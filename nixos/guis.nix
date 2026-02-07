# Graphical Applications
{
  lib,
  config,
  pkgs,
  unstable,
  ...
}:
{
  programs.firefox.enable = true;
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
    kdePackages.gwenview
    obsidian
    wezterm
    zathura
    unstable.zotero
  ];
}
