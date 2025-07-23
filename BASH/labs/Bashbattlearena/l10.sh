#!/bin/bash

# 1. Creates a directory called Arena_Boss.
mkdir -p Arena_Boss

# 2. Creates 5 text files inside the directory, named file1.txt to file5.txt.
# 3. Generates a random number of lines (between 10 and 20) in each file.

mkdir Arena_Boss

for i in {1..5}
do
    FILE="Arena_Boss/file$i.txt"
    LINES=$((RANDOM % 11 + 10))
    for j in $(seq 1 $LINES)
    do
        echo "This is line $j" >> "$FILE"
    done
done

# 4. Sorts these files by their size and displays the list.

echo "Files sorted by size:"
find Arena_Boss -type f -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9}'

# 5. Checks if any of the files contain the word 'Victory', and if found, moves the file to a directory called Victory_Archive.

mkdir -p Victory_Archive

for FILE in Arena/*.txt 
do
    if [ grep -q "Victory" "$FILE" ]; then 
        mv $FILE Victory_Archive/
        echo "$FILE contains "Victory" and has been moved to "Victory_Archive" directory."
    fi
done