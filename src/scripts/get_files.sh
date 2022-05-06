#!/usr/bin/env sh

set -e

# shellcheck disable=SC2153
directory="${DIRECTORY}"
# shellcheck disable=SC2153
files="${FILES}"
newline_str='
'
(
    cd "$directory"
    #shellcheck disable=SC2086
    IFS="$newline_str" tar c $files
)
