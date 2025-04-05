#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This script is used to update weave-core.

update_git_submodules() {
  git submodule update --init --recursive
  git submodule foreach '
    echo "\e[33mUpdating $name...\e[0m"
    git checkout main || { echo -e "\e[31mFailed to checkout main branch in $name\e[0m"; exit 1; }
    git pull origin main || { echo -e "\e[31mFailed to pull from main in $name\e[0m"; exit 1; }
    echo "\e[32m$name updated successfully!\e[0m"]
  '
}

echo -e "\e[32mUpdating weave...\e[0m"

# Update weave-core
update_git_submodules

# Update weave.sh from distant core file
if [ -f "./weave-core/weave.sh.dist" ]; then
    echo -e "\e[33mUpdating weave.sh...\e[0m"

    cp ./weave-core/weave.sh.dist ./weave.sh
    chmod 755 ./weave.sh

    echo -e "\e[32mweave.sh updated successfully!\e[0m"
fi

# Update available services
cd weave-core
update_git_submodules

echo -e "\e[32mweave updated successfully!\e[0m"
