#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This script is used to to manage a weave application.

# Check for the correct number of arguments
if ! [ -z "$3" ]; then
    echo -e "\e[31mToo many arguments. Exiting...\e[0m"
    echo "\e[33mUsage: ./weave.sh <start|stop|update|add-service|backup-task|backup-enable|backup-disable>\e[0m"
    exit 1
fi

(
    # Exectue from application root
    cd "$(dirname "$0")"

    # Source environment helpers
    if [ -f "./weave/helpers/environment.sh" ]; then
        source ./weave/helpers/environment.sh
    else
        echo -e "\e[31mCannot find 'environment' file. Exiting...\e[0m"
        exit 1
    fi

    # Defines APP_NAME, SERVICES_DIRECTORY
    set_application_environment

    # Execute the appropriate script based on command line argument
    # $2 is used to pass a service name to execute only that service's script
    case "$1" in
        start) ./weave/commands/start.sh $2;;
        stop) ./weave/commands/stop.sh $2;;
        update|update-weave) ./weave/commands/update.sh $2;;
        add|add-service) ./weave/commands/add-service.sh;;
        bak|backup-task) ./weave/commands/backup-task.sh $2;;
        bak-on|backup-enable) ./weave/commands/backup-enable.sh;;
        bak-off|backup-disable) ./weave/commands/backup-disable.sh;;
    *)
        echo -e "\e[31mInvalid or missing argument. Exiting...\e[0m"
        echo "\e[33mUsage: ./weave.sh <start|stop|update|add|bak|bak-on|bak-off>\e[0m"
        exit 1
        ;;
    esac
)