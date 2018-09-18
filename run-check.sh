#!/bin/bash

echo "Checking for secrets. Passing @$ to trufflehog. This may come up with false positives, use your judgment on each result."

echo "Checking for trufflehog..."

if ! [ -x "$(command -v trufflehog)" ]; then
    read -p "trufflehog not installed. do you want to install it (for the local user)? y[n] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "exiting script as it requires trufflehog"
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    else
        echo "installing trufflehog"
        pip install trufflehog --user
    fi
fi

echo "running trufflehog"
trufflehog --entropy 0 --regex --rules trufflehog_regexes.json $@
