#!/bin/bash

# Kill all running containers with the name "bitwarden" in them
docker kill $(docker ps -q --filter "name=bitwarden")

# Remove all stopped containers with the name "bitwarden" in them
docker rm $(docker ps -aq --filter "name=bitwarden")

