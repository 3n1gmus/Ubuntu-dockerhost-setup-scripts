#!/bin/bash

# Define the paths for log files
LOG_FILE="/var/log/apt-auto-update.log"
ERROR_LOG_FILE="/var/log/apt-auto-update-error.log"

# Redirect all output to log files
exec >> "$LOG_FILE" 2>> "$ERROR_LOG_FILE"

# Log the start time
echo "=== Auto Update Script ==="
echo "$(date): Starting automatic updates..."

# Update package information
echo "$(date): Running 'apt update'..."
sudo apt update

# Upgrade packages
echo "$(date): Running 'apt upgrade'..."
sudo apt upgrade -y

# Reboot the system
echo "$(date): Rebooting system..."
sudo reboot

# Log the end time
echo "$(date): Automatic updates and reboot completed."
echo "==========================="

# Exit the script
exit 0