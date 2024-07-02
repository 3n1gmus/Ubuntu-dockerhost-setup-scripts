#!/bin/bash

# Backup existing host keys (optional but recommended)
sudo mkdir -p /etc/ssh/backup
sudo mv /etc/ssh/ssh_host_* /etc/ssh/backup/

# Regenerate SSH host keys
sudo dpkg-reconfigure openssh-server

echo "SSH host key regeneration complete."