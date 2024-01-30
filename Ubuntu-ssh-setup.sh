#!/bin/bash

# Specify the IP address to listen on
LISTEN_IP="your_desired_ip_address"

# Backup SSH configuration file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup

# Update SSH regularly
sudo apt update
sudo apt install --only-upgrade openssh-server

# Disable root login
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Configure SSH to listen on a specific IP address
sudo sed -i "s/^#ListenAddress.*/ListenAddress $LISTEN_IP/" /etc/ssh/sshd_config

# Use strong passwords or SSH keys
# Note: Ensure you have SSH keys set up before disabling password authentication
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

# Change default SSH port
# sudo sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config

# Configure SSH banner
echo "Warning: Unauthorized access is prohibited. This system is monitored." | sudo tee /etc/issue.net
sudo sed -i 's/^#Banner.*/Banner \/etc\/issue.net/' /etc/ssh/sshd_config

# Limit user access with AllowUsers and AllowGroups
# Add your username or group as needed
# sudo sed -i 's/^#AllowUsers.*/AllowUsers your_username/' /etc/ssh/sshd_config
# or
# sudo sed -i 's/^#AllowGroups.*/AllowGroups sshusers/' /etc/ssh/sshd_config

# Use two-factor authentication (2FA) - Install Google Authenticator
# sudo apt install libpam-google-authenticator

# Configure PAM for 2FA
# echo "auth required pam_google_authenticator.so" | sudo tee -a /etc/pam.d/sshd
# sudo sed -i 's/^ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config

# Monitor and log SSH activity - Install fail2ban
sudo apt install fail2ban

# Copy the default fail2ban configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Restart SSH and fail2ban services
sudo systemctl restart ssh
sudo systemctl restart fail2ban

echo "SSH best practices configuration completed."
