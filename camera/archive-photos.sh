#!/bin/bash

# copy the images from the shared memory to the persistent storage
rsync -av /dev/shm/camera/ /home/camera/photos

# remove the images from the shared memory
find /dev/shm/camera/ -maxdepth 5 -mmin +20 -type f -delete