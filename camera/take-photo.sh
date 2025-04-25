#!/bin/bash

# use shared memory as base folder for the images
# this is a RAM disk, so it is faster and it does not wear out the SD card
DEST_FOLDER=/dev/shm/camera
# DEST_FOLDER=/tmp/camera/images
# default sensor resolution 4608x2592
# IMAGE_WIDTH=4608
# IMAGE_HEIGHT=2592
# 4K resolution
IMAGE_WIDTH=3840
IMAGE_HEIGHT=2160
IMAGE_QUALITY=90

# Check the used space in the destination folder
USED_SPACE=$(df -h --output=pcent "/dev/shm/" | tail -n +2 | awk '{print $1}' | sed 's/%//')
echo "Used space: $USED_SPACE%"
if [ "$USED_SPACE" -ge "90" ]; then
    echo "Used space is above 90%, aborting photo capture."
    exit 1
fi

# parse script params: night-mode, if set to 1, the camera will use night mode

# by default, night mode is disabled
NIGHT_MODE=0

# if the first param is set to 1, enable night mode
if [ "$1" == "1" ]; then
    NIGHT_MODE=1
fi


# take photo with the camera and save the image to the
# specified location with the specified name, based on the current date and time


# stop execution if there is a lock file
if [ -f $DEST_FOLDER/lock ]; then
    echo "Lock file found, exiting"
    exit 1
fi


# create the base folder if it does not exist
mkdir -p $DEST_FOLDER

# calculate the destination folder based on the current date and hour
DEST_FOLDER=$DEST_FOLDER/$(date +"%Y/%m/%d/%H")
DEST_FILE=$DEST_FOLDER/$(date +"photo_%Y-%m-%d_%H-%M-%S").jpg

# create the destination folder if it does not exist
mkdir -p $DEST_FOLDER

echo "Taking photo and saving it to $DEST_FILE"

# set focus mode and params
FOCUS_PARAMS="--autofocus-mode manual --lens-position 0"

# set shutter time, if is night mode
if [ $NIGHT_MODE -eq 1 ]; then
    SHUTTER_PARAMS="--shutter 10s"
fi

# construct the command to take instant photo using libcamera
COMMAND="libcamera-still --immediate  --mode 4608:2592:12:P -q $IMAGE_QUALITY --width $IMAGE_WIDTH --height $IMAGE_HEIGHT -o $DEST_FILE $FOCUS_PARAMS $SHUTTER_PARAMS"

# execute the command
$COMMAND