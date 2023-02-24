#!/bin/bash
# remove podman, install docker

sudo systemctl stop podman
sudo systemctl disable podman
sudo yum remove -y podman
sudo rm -rf /etc/containers
sudo rm -rf /var/lib/containers
sudo yum autoremove -y
podman version

# Update the package list
sudo yum update

# Upgrade the installed packages
sudo yum upgrade

# utilities for Docker
sudo yum install -y yum-utils
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# install docker
#sudo yum install docker.io -y
#sudo yum install docker-ce -y
#sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# repo method

#sudo yum install -y yum-utils
#sudo yum-config-manager \
#    --add-repo \
#    https://download.docker.com/linux/rhel/docker-ce.repo

# script method

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Start the Docker service
sudo systemctl start docker

# Add the current user to the docker group
sudo usermod -aG docker secsols3

# Set the permissions for the Docker socket
sudo chmod 666 /var/run/docker.sock


# Enable Docker to start at boot
sudo systemctl enable docker

# check if installed
sudo docker run hello-world

# Install Docker Compose
sudo yum update
sudo yum install docker-compose-plugin
sudo systemctl start docker
docker compose version

# Create the directory for the Portainer Docker container configuration
sudo mkdir -p /portainer

# Change to the Portainer directory
cd /portainer

# Create the docker-compose.yml file
cat > docker-compose.yml <<EOF
version: '3.10'
services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    restart: always
    ports:
      - "9443:9443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
volumes:
  portainer_data:
EOF

