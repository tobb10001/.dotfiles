#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")/.."

if command -v ansible-community > /dev/null; then
	echo "ansible is installed"
elif command -v apt > /dev/null; then
	sudo apt install ansible
elif command -v dnf > /dev/null; then
	sudo dnf --assumeyes install ansible
elif command -v zypper > /dev/null; then
	# Run an update first to accept that weird thingy.
	sudo zypper update
	sudo zypper --non-interactive install ansible
else
	echo "Not a package manager that I know of is present..."
	exit 1
fi

cd ansible

ansible-playbook --ask-become-pass playbook.yml
