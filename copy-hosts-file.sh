#!/bin/bash

SCRIPT_HOME="$(cd $(dirname $0) && pwd)"

ANSIBLE_COMMAND="$(which ansible-playbook)"

# Check for Ansible
if [ ! -x "$ANSIBLE_COMMAND" ]; then
    echo -e "\nFATAL: unable to find the 'ansible-playbook' command; please make sure that Ansible is installed and accessible\n"
    exit 1
fi

echo -e "Starting copy hosts file"

(cd $SCRIPT_HOME; ansible-playbook -i "poc-windows-inventory.yml" "$@" "/root/netops-ansible/roles/common/tasks/copy_hosts_windows.yml")

(cd $SCRIPT_HOME; ansible-playbook -i "poc-linux-inventory.yml" "$@" "/root/netops-ansible/roles/common/tasks/copy_hosts_linux.yml")

