#!/usr/bin/env bash

set -euxo pipefail

: Install Nix
if [ ! -d /nix ]; then
	sh <(curl -L https://nixos.org/nix/install) --daemon
fi

: Install Home Manager
nix-shell '<home-manager>' -A install
