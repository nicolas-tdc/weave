#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This script is used to update weave-core.

# Function: add_git_submodule
# Purpose: Adds a git submodule if it doesn't already exist.
# Arguments:
#   $1: The repository URL of the submodule.
#   $2: The path where the submodule should be added.
# Returns:
#   0: If the submodule was added successfully.
#   1: If the submodule already exists or if the arguments are invalid.
# Usage: add_git_submodule <repository_url> <submodule_path>
add_git_submodule() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo -e "\e[31madd_git_submodule - Error: Missing arguments.\e[0m"
        echo -e "\e[33mUsage: add_git_submodule <repository_url> <submodule_path>\e[0m"
        return 1
    fi

    local repository_url="$1"
    local submodule_path="$2"

    # Create .gitmodules file if it doesn't exist
    [ ! -f ".gitmodules" ] && touch ".gitmodules"

    # Add the submodule
    if ! [ -d "$submodule_path" ]; then
        echo -e "\e[33mAdding submodule '$submodule_path'...\e[0m"
        git submodule add -f "$repository_url" "$submodule_path"
        echo -e "\e[32mSubmodule '$submodule_path' added.\e[0m"
    fi
}

# Function: update_git_submodules
# Purpose: Updates all git submodules to the latest version.
# Arguments: None
# Returns:
#   0: If all submodules were updated successfully.
#   1: If there was an error updating any submodule.
# Usage: update_git_submodules
update_git_submodules() {
    # Update the submodules
    git submodule update --init --recursive
    # Pull the latest changes from the main branch of each submodule
    git submodule foreach '
        echo "\e[33mUpdating $name...\e[0m"
        git checkout main || { echo -e "\e[31mFailed to checkout main branch in $name\e[0m"; exit 1; }
        git pull origin main || { echo -e "\e[31mFailed to pull from main in $name\e[0m"; exit 1; }
        echo "\e[32m$name updated successfully!\e[0m"]
    '
}

echo -e "\e[32mUpdating weave...\e[0m"

# Add weave-core submodule if it doesn't exist
add_git_submodule git@github.com:nicolas-tdc/weave-core.git weave-core

# Update weave-core
update_git_submodules

# Update weave.sh with updated weave-core file
if [ -f "./weave-core/weave.sh.dist" ]; then
    echo -e "\e[33mUpdating weave.sh...\e[0m"

    cp ./weave-core/weave.sh.dist ./weave.sh
    chmod 755 ./weave.sh

    echo -e "\e[32mweave.sh updated successfully!\e[0m"
fi

echo -e "\e[32mweave updated successfully!\e[0m"
