#!/bin/bash

SCRIPT_HOME="$(cd $(dirname $0) && pwd)"

ANSIBLE_COMMAND="$(which ansible-playbook)"

# Check for Ansible
if [ ! -x "$ANSIBLE_COMMAND" ]; then
    echo -e "\nFATAL: unable to find the 'ansible-playbook' command; please make sure that Ansible is installed and accessible\n"
    exit 1
fi

echo -e "Starting deployment using Windows inventory"

(cd $SCRIPT_HOME; ansible-playbook -i "poc-windows-inventory.yml" -e "@configurations/local-installers.yml" "$@" "poc-windows-playbook.yml" "--ask-become-pass")

echo -e "Starting deployment using Linux inventory"

(cd $SCRIPT_HOME; ansible-playbook -i "poc-linux-inventory.yml" -e "@configurations/local-installers.yml" "$@" "poc-linux-playbook.yml")


