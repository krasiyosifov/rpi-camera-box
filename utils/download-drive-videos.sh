#!/bin/bash

# change directory to current script location
cd "$(dirname "$0")"

LOCAL_FOLDER=./../videos
RPI_HOST=camera-drive.lan
RPI_USER=camera
RPI_FOLDER=/home/camera/videos

# download the photos from the Raspberry Pi camera to local storage
rsync -avh $RPI_USER@$RPI_HOST:$RPI_FOLDER/ $LOCAL_FOLDER/ --progress