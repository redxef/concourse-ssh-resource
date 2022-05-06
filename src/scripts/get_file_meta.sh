#!/usr/bin/env sh

set -e

# shellcheck disable=SC2153
directory="${DIRECTORY}"
# shellcheck disable=SC2153
files="${FILES}"

if [ -z "$files" ]; then
    exit 0
fi

(
    echo "$files" | while read -r file; do
        echo "$directory/$file"
        if [ -e "$directory/$file" ]; then
            echo true
            stat --format=%Y "$directory/$file"
        else
            echo false
            echo "# --PLACEHOLDER--"
        fi
    done
)
