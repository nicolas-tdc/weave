#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This script is used to install and update weave-core.

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

echo -e "\e[32mUpdating weave...\e[0m"

# Copy default environment files to service's root directory
if [ -d "./env-remote" ]; then
    for file in ./env-remote/.*; do
        [ -f "$file" ] && [ ! -e "./$(basename "$file")" ] && cp -n "$file" ./
    done
fi

# Add weave-core submodule if it doesn't exist
add_git_submodule git@github.com:nicolas-tdc/weave-core.git weave-core

if [ -f "./weave-core/helpers/git.sh" ]; then
    source ./weave-core/helpers/git.sh
else
    echo -e "\e[31mError: weave-core/helpers/git.sh not found.\e[0m"
    exit 1
fi

# Update weave-core
update_git_submodules

# Update weave.sh with updated weave-core file
if [ -f "./weave-core/weave.sh" ]; then
    echo -e "\e[33mUpdating weave.sh...\e[0m"

    cp ./weave-core/weave.sh ./weave.sh
    chmod 755 ./weave.sh

    echo -e "\e[32mweave.sh updated successfully!\e[0m"
fi

echo -e "\e[32mweave updated successfully!\e[0m"
