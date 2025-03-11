!/bin/bash

# Update Apt 
sudo apt-get update

# Install Cockpit (NFS and ZIP)
sudo apt-get install -y ca-certificates curl gnupg lsb-release wget apt-transport-https software-properties-common net-tools nfs-common cifs-utils unzip zip logrotate vim

# Remove Snap
sudo apt autoremove --purge snapd

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

# Create Portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# Automatic Ubuntu Updates
sudo apt install unattended-upgrades
sudo apt install update-notifier-common
sudo mkdir /etc/orig_config
sudo mv /etc/apt/apt.conf.d/50unattended-upgrades /etc/orig_config/50unattended-upgrades.original
sudo touch /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::Allowed-Origins {" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "        \"\${distro_id}:\${distro_codename}\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "        \"\${distro_id}:\${distro_codename}-security\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "        \"\${distro_id}ESMApps:\${distro_codename}-apps-security\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "        \"\${distro_id}ESM:\${distro_codename}-infra-security\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "//Specific Settings" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::Package-Blacklist {};" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::DevRelease \"auto\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::Automatic-Reboot \"true\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::Automatic-Reboot-WithUsers \"true\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades
echo "Unattended-Upgrade::Automatic-Reboot-Time \"02:00\";" | sudo tee -a /etc/apt/apt.conf.d/50unattended-upgrades

# Set Timezone
sudo timedatectl set-timezone America/Denver

# Finished