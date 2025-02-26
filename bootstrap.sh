#!/usr/bin/env bash

set -euo pipefail

if command -v ansible-community > /dev/null; then
	echo "ansible is installed"
else
	sudo apt install ansible
fi

cd ansible

ansible-playbook playbook.yml
