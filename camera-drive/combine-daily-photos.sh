
# This script is used to combine all photos in the subfolders of the given directory into a single folder.

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

# find all photos in the subfolders of the given source directory and combine them into a destination folder
find $SOURCE_FOLDER -type f -name "*.jpg" -exec mv {} $DEST_FOLDER \;