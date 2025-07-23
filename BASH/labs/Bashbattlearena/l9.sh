#!/bin/bash

DIRECTORY="Arena"
LOG="log.txt"

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist."
    exit 1
fi

fswatch -r "$DIRECTORY" | while read change; do
    if [ -e "$change" ]; then
        echo "$(date +'%Y-%m-%d %H:%M:%S') File modified/created: $change" >> "$LOG"
    else
        echo "$(date +'%Y-%m-%d %H:%M:%S') File deleted: $change" >> "$LOG"
    fi
done

