{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    gurobi
  ];
}
