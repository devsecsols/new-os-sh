#!/bin/bash

# Update the package manager
sudo dnf update

# Install the required packages
sudo dnf install cockpit-composer 
sudo dnf install cockpit-machines
sudo dnf install cockepit-packagekit 
sudo dnf install cockpit-pcp

# Enable and start the pmlogger.service and pmproxy.service systemd units
sudo systemctl enable --now pmlogger.service pmproxy.service
