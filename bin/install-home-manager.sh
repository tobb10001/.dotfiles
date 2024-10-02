: Install Home Manager

if ! nix-channel --list | grep -E '^home-manager'; then
	version=$(nix-channel --list | grep -E '^nixpkgs' | grep -oE '[0-9]{2}\.[0-9]{2}')
	nix-channel --add https://github.com/nix-community/home-manager/archive/release-$version.tar.gz home-manager
	nix-channel --update
fi

nix-shell '<home-manager>' -A install
