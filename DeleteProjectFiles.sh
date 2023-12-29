#!/bin/bash

echo "Deleting all project files"

extensions=".sln .vcxproj .vcxproj.filters .vcxproj.users"

if [ -d "./build" ]; then
    echo "Deleting directory: './build'"
    rm -r "./build"
fi

for d in */; do
    echo "Processing directory: $d"
    cd "$d" || exit
    for e in $extensions; do
        if ls *"$e" 1>/dev/null 2>&1; then
            rm -f *"$e"
        fi
    done
    cd ..
done

rm ./*.sln

echo "Complete!"
