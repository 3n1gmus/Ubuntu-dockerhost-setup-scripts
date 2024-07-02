#!/bin/bash

# Backup existing keys (optional but recommended)
mkdir -p ~/ssh_backup
mv ~/.ssh/id_rsa* ~/ssh_backup/ 2>/dev/null

# Delete existing keys
rm ~/.ssh/id_rsa* 2>/dev/null

# Generate new SSH key pair without passphrase
ssh-keygen -t rsa -b 4096 -N ""

# Add new SSH key to SSH agent (optional)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "SSH key regeneration complete."