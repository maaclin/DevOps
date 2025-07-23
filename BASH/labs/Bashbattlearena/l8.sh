#!/bin/bash 

read -p "Enter keyword to search: " key
read -p "Enter directory to search in: " direct

if [ ! -d "$direct" ]; then
    echo "Directory not found."
    exit 1
fi

grep -l "$key" "$direct"/*.log