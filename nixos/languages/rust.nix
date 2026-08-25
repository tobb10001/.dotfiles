{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    cargo
    cargo-insta
    rust-analyzer
    rustc
    rustfmt
  ];
}
