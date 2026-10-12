{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstablepkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-zoteropkgs.url = "github:NixOS/nixpkgs?ref=44a9556dfb0024ee65a68ccb6ed66492426e2650";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell?ref=cachix";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "unstablepkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      unstablepkgs,
      nixpkgs-zoteropkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      unstable = import unstablepkgs {
        inherit system;
        config.allowUnfree = true;
      };
      nixpkgs-zotero = import nixpkgs-zoteropkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."Tobias-TB16G7" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs unstable nixpkgs-zotero; };
        modules = [ ./configuration.nix ];
      };
    };
}
