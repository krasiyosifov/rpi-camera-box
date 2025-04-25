#!/bin/bash

# remove photos, older than 10 minutes from RAM drive
find /dev/shm/camera/ -mindepth 2 -maxdepth 6 -mmin +10 -type f -delete

# clean empty folders from the shared memory
find /dev/shm/camera/ -mindepth 2 -maxdepth 6 -mmin +10 -empty -type d -exec rmdir {} \;