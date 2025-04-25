#!/bin/bash

# change directory to current script location
cd "$(dirname "$0")"

LOCAL_FOLDER=~/photos
RPI_CAMERA_IP=camera.lan
RPI_USER=pi
RPI_CAMERA_FOLDER=/dev/shm/camera
RPI_CAMERA_BACKUP_FOLDER=/home/camera/photos

# download the photos from the Raspberry Pi camera to local storage
rsync -avh $RPI_USER@$RPI_CAMERA_IP:$RPI_CAMERA_FOLDER/ $LOCAL_FOLDER/

# download the photos from the Raspberry Pi camera to local storage
#rsync -avh $RPI_USER@$RPI_CAMERA_IP:$RPI_CAMERA_BACKUP_FOLDER/ $LOCAL_FOLDER/