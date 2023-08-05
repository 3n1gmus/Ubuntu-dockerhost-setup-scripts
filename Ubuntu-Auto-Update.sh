#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Update package lists
apt update

# Install unattended-upgrades if not already installed
apt install -y unattended-upgrades

# Enable automatic updates
echo 'APT::Periodic::Update-Package-Lists "1";' > /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

# Configure update schedule (daily)
echo 'APT::Periodic::RandomSleep "360";' >> /etc/apt/apt.conf.d/20auto-upgrades

# Set email address to receive update notifications
# Replace 'your_email@example.com' with your actual email address
echo 'Unattended-Upgrade::Mail "your_email@example.com";' >> /etc/apt/apt.conf.d/50unattended-upgrades

# Optionally, you can configure the reboot options after updates (e.g., only if needed, automatic)
# Uncomment the following lines if you want to enable these options
# echo 'Unattended-Upgrade::Automatic-Reboot "true";' >> /etc/apt/apt.conf.d/50unattended-upgrades
# echo 'Unattended-Upgrade::Automatic-Reboot-Time "03:00";' >> /etc/apt/apt.conf.d/50unattended-upgrades

# Restart the unattended-upgrades service to apply the changes
systemctl restart unattended-upgrades

echo "Automatic updates have been configured successfully."
