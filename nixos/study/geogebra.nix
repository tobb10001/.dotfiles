{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    geogebra6
    giac-with-xcas
  ];
}
