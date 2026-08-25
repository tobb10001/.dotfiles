{
  pkgs,
  ...
}:
{

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
    };
  };

  users.users.tobi = {
    extraGroups = [
      "docker"
      "podman"
    ];
  };

  environment.systemPackages = with pkgs; [
    docker-client
    podman-compose

    distrobox
  ];
}
