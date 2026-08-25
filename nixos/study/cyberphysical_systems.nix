{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    fritzing
    rpi-imager
  ];
}
