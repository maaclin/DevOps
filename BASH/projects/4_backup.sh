#!/bin/bash

read -p "Enter directory: " direct

# Check if input directory exists
if [ ! -d "$direct" ]; then
    echo "Directory '$direct' does not exist."
    exit 1
fi

# Create Backup directory if it doesn't exist
mkdir -p Backup

# Check for .txt files and copy them
files=("$direct"/*.txt)

if [ -e "${files[0]}" ]; then
    cp "$direct"/*.txt Backup/
    echo "Files copied from $direct to Backup."
else
    echo "No .txt files in directory."
    exit 1
fi