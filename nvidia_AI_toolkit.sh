# From: https://stackoverflow.com/questions/78038265/docker-error-with-nvidia-gpu-libnvidia-ml-so-1-not-found-despite-successful-nvi

# Ubuntu 22.04 Desktop
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
# sudo dpkg -i cuda-keyring_1.1-1_all.deb
# sudo apt-get update
## To install the legacy kernel module flavor
# sudo apt-get install -y cuda-drivers
## To install the open kernel module flavor of specific version
## sudo apt-get install -y nvidia-driver-550-open

# Ubuntu Server Headless

# Kernel?
# sudo apt-get install --install-recommends linux-generic-hwe-22.04

# Drivers
sudo apt-get install nvidia-headless-550