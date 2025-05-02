#!/usr/bin/env bash

set -euxo pipefail

TMPDIR=/tmp/my-dev-env
mkdir -p "$TMPDIR"
# rsync -a --exclude='.git' . "$TMPDIR"
cp ./flake.nix "$TMPDIR/"
cd "$TMPDIR"

if nix profile list | grep my-dev-env; then
	nix profile upgrade --no-write-lock-file my-dev-env
else
	nix profile install --no-write-lock-file .#defaultPackage.x86_64-linux
fi
