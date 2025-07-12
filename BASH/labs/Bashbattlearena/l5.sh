#!/bin/bash 

mkdir Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

mkdir Archive
if [ -f Battlefield/knight.txt ]; then
    mkdir -p Archive
    mv Battlefield/knight.txt Archive/knight.txt
    echo "Moved from Battlefield to Archive."
else
    echo "knight.txt not found."
fi

echo "Battlefield:"
ls Battlefield

echo "Archive:"
ls Archive