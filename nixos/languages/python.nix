{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      acl
      attr
      bzip2
      curl
      libsodium
      libssh
      libxml2
      openssl
      stdenv.cc.cc
      systemd
      util-linux
      xz
      zlib
      zstd
    ];
  };

  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "python" ''
      export LD_BINARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${pkgs.python3}/bin/python "$@"
    '')
    ruff
    ty
    uv
  ];
}
