#!/bin/bash

read -p "Enter filename: " file

if [ -f "$file" ]; then
    echo "File exists"

else
    echo "File does not exist!"
    exit 1
fi 

if [ -r "$file" ]; then
    echo "File is readable"
fi

if [ -w "$file" ]; then 
    echo "File is writeable"
fi

if [ -x "$file" ]; then 
    echo "File is executable"
fi

if [ ! -r "$file" ] && [ ! -w "$file" ] && [ ! -x "$file" ]; then
    echo "File has no permissions." 
fi
