{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "unstablepkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      unstablepkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      unstable = import unstablepkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."Tobias-TB16G7" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs unstable; };
        modules = [ ./configuration.nix ];
      };
    };
}
