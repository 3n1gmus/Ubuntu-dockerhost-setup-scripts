#!/bin/bash

# Define network configuration parameters
NETWORK_CONFIG_FILE="/etc/netplan/01-netcfg.yaml"
INTERFACE_NAME="ens33"  # Change this to your actual interface name
STATIC_IP="192.168.1.100"  # Change this to your desired static IP address
NETMASK="255.255.255.0"
GATEWAY="192.168.1.1"  # Change this to your gateway IP address
DNS_SERVER="8.8.8.8"  # Change this to your DNS server IP address

# Create or modify the Netplan configuration file
echo "network:
  version: 2
  renderer: networkd
  ethernets:
    $INTERFACE_NAME:
      addresses: [$STATIC_IP/24]
      gateway4: $GATEWAY
      nameservers:
        addresses: [$DNS_SERVER]" | sudo tee $NETWORK_CONFIG_FILE

# Apply the network configuration
sudo netplan apply

# Restart the networking service
sudo systemctl restart network-manager

echo "Static IP address configuration complete."
