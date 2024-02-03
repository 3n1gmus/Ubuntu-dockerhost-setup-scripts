#!/bin/bash

# Note: Copy one level up from script source folder.

# Remove Existing
rm -dfr ./Linux-Bash-Backup-Scripts/

# Clone from Source
git clone https://github.com/3n1gmus/Ubuntu-dockerhost-setup-scripts.git

# Set Execution
chmod +x ./Ubuntu-dockerhost-setup-scripts/*.sh