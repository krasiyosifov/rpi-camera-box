#!/bin/bash

# the script pushes local photos from /dev/shm to a remote server
# it uses rsync for secure file transfer and ssh key authentication

# on error, stop execution
set -e

# change directory to current script location
cd "$(dirname "$0")"

PHOTOS_FOLDER=/dev/shm/camera

REMOTE_SERVER=camera-drive.lan
REMOTE_USER=camera
REMOTE_FOLDER=/home/camera/photos

# download the photos from the Raspberry Pi camera to the local folder
rsync -av $PHOTOS_FOLDER $REMOTE_USER@$REMOTE_SERVER:$REMOTE_FOLDER/

echo "Photos have been successfully transferred to the remote server."

# cleanup the images from the shared memory
( ./cleanup-memory.sh )


