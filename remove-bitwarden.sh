#!/bin/bash

# Kill all running containers with the name "bitwarden" in them
docker kill $(docker ps -q --filter "name=bitwarden")

# Remove all stopped containers with the name "bitwarden" in them
docker rm $(docker ps -aq --filter "name=bitwarden")

# Remove the "bitwarden.sh" file in the current user's home directory
rm -f "$HOME/bitwarden/bitwarden.sh"

# Remove the "bitwarden.sh" file in the current user's home directory
rm -f "$HOME/bitwarden/remove-bitwarden.sh"

# Delete the "bitwarden" directory in the current user's home directory
rm -rf "$HOME/bitwarden"
