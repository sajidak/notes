#!/bin/bash

# Check if a directory argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_with_pub_files>"
    exit 1
fi

DIRECTORY="$1";

# Check if the provided directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi


# Create a timestamped output log file
TIMESTAMP=$(date +"%Y%m%d_%H%M%S");
# OUTPUT_LOG="${HOME}/Documents/T15/fingerprints_$TIMESTAMP.log";
OUTPUT_LOG="${DIRECTORY}/all-fingerprints.txt"

# Iterate over all .pub files in the directory
for file in ${DIRECTORY}/*.pub; do
    # echo "Processing: $file" | tee -a "$OUTPUT_LOG"
    echo "Public Key: $(basename ${file})" | tee -a "$OUTPUT_LOG"
    cat ${file} | tee -a "$OUTPUT_LOG";
    ssh-keygen -vlf "$file"  | tee -a "$OUTPUT_LOG"
    echo "" | tee -a "$OUTPUT_LOG"
done
