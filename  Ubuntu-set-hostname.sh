#!/bin/bash

# Prompt user for new hostname
read -p "Enter the new hostname: " new_hostname

# Update the hostname in /etc/hostname
echo "$new_hostname" | sudo tee /etc/hostname > /dev/null

# Update the hostname in /etc/hosts
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname/" /etc/hosts

# Notify the user to restart for changes to take effect
echo "Hostname updated to $new_hostname. Please restart your system for the changes to take effect."