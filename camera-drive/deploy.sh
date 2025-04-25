#!/bin/bash

# Change directory to the script's location
cd "$(dirname "$0")"

# Define the source and destination paths
SOURCE_DIR="./"
DESTINATION_USER="camera@camera-drive.lan:/home/camera/scripts/"


# Step 1: Sync all files except images subfolder to Raspberry Pi filesystem over network
rsync -av --exclude='deploy.sh' $SOURCE_DIR $DESTINATION_USER --delete

echo "Deployment successful! Files have been synced to the Camera Drive RPi."