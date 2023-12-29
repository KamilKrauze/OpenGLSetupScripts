#!/bin/bash

echo "Deleting all project files"

find . -maxdepth 1 -type f -name 'Makefile' -delete

echo "Complete!"
