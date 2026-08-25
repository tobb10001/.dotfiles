{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # TOML
    taplo
    # YAML
    yaml-language-server
  ];
}
