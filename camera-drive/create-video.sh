#!/bin/bash

# change directory to current script location
cd "$(dirname "$0")"

# take the source folder as the first argument
SOURCE_FOLDER=$1

# validate the folder exists
if [ ! -d $SOURCE_FOLDER ]; then
    echo "Source folder does not exist"
    exit 1
fi

# take the destination folder as the second argument
DEST_FOLDER=$2

# validate the folder exists
if [ ! -d $DEST_FOLDER ]; then
    echo "Destination folder does not exist"
    exit 1
fi


find $SOURCE_FOLDER -type f  -name "*.jpg" | sort | sed 's/^/file /' > frames.txt

ffmpeg -f concat -safe 0 -i frames.txt -c copy $DEST_FOLDER/$(date +"timelapse-video_%Y-%m-%d_%H-%M-%S").mp4