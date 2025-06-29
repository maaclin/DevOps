#!/bin/bash 

read -p "Which directory are you searching in: " direct

if [ ! -d $direct ]; then
    echo "Directory does not exist!"
    exit 1
fi


: '  
find = search tool -type f = look for files (not folders)
-exec = execute a command on every file it finds
{} = placeholder for the filename
+ = run the command on multiple files at once (faster)
 ' 

find $direct -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9}'

