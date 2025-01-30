#!/bin/bash

# Check for required dependencies
if ! command -v identify &> /dev/null; then
    echo "ImageMagick is required. Install it using 'sudo apt install imagemagick' or your package manager."
    exit 1
fi

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

# Find and process images
find "$DIRECTORY" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) | while read -r IMAGE; do
    RESOLUTION=$(identify -format "%w %h" "$IMAGE" 2>/dev/null)
    if [ -z "$RESOLUTION" ]; then
        echo "Skipping non-image file: $IMAGE"
        continue
    fi

    WIDTH=$(echo "$RESOLUTION" | awk '{print $1}')
    HEIGHT=$(echo "$RESOLUTION" | awk '{print $2}')

    if [ "$WIDTH" -lt 1920 ] || [ "$HEIGHT" -lt 1080 ]; then
        echo "Deleting $IMAGE (Resolution: ${WIDTH}x${HEIGHT})"
        rm "$IMAGE"
    else
        echo "Keeping $IMAGE (Resolution: ${WIDTH}x${HEIGHT})"
    fi
done

echo "Operation complete."
