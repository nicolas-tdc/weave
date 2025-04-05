#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This script is used to update weave-core.

echo -e "\e[32mUpdating weave-core and weave.sh...\e[0m"

# Ensure submodules are initialized and updated
git submodule update --init --recursive

# Iterate through each submodule
git submodule foreach '
  echo "Pulling latest changes for submodule: $name"
  git checkout main || { echo "Failed to checkout main branch in $name"; exit 1; }
  git pull origin main || { echo "Failed to pull from main in $name"; exit 1; }
'

if [ -f "./weave-core/weave.sh.dist" ]; then
    echo -e "\e[32mCopying updated weave.sh...\e[0m"
    cp ./weave-core/weave.sh.dist ./weave.sh
    chmod 755 ./weave.sh
fi

echo "weave-core and weave.sh updated successfully!"
