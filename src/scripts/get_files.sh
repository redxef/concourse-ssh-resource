#!/usr/bin/env sh

set -e

directory="${DIRECTORY}"
files="${FILES}"
(
    echo tar c $files >&2
    IFS=$'\n' tar c $files
)
