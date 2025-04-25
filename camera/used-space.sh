#!/bin/bash

DEST_FOLDER=/dev/shm/camera


# Check the used space in the destination folder
USED_SPACE=$(df -h --output=pcent "/dev/shm/" | tail -n +2 | awk '{print $1}' | sed 's/%//')
echo "Used space: $USED_SPACE%"
if [ "$USED_SPACE" -ge "90" ]; then
    echo "Used space is above 90%, aborting photo capture."
    exit 1
fi
