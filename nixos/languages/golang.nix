{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    gcc
    go
    golangci-lint
    gofumpt
    gopls
  ];
}
