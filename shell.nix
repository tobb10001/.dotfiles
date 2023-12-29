{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
	nativeBuildInputs = [
		pkgs.luajitPackages.lua-lsp
	];
}
