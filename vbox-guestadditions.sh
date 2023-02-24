#!/bin/bash

# Install necessary packages
sudo yum install -y kernel-devel kernel-headers gcc make perl

# Mount the VirtualBox Guest Additions ISO file
sudo mount /dev/cdrom /mnt

# Change to the mounted directory
cd /mnt

# Run the installation script
sudo ./VBoxLinuxAdditions.run

# Unmount the ISO file
sudo umount /mnt

# Reboot the virtual machine
sudo reboot
