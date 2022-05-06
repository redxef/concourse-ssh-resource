#!/usr/bin/env sh

set -e

# shellcheck disable=SC2153
directory="${DIRECTORY}"
# shellcheck disable=SC2153
workdir="${WORKDIR}"
# shellcheck disable=SC2153
extract="${EXTRACT}"
(
    if "$extract"; then
        cd "$directory"
        tar x
    fi
)
(
    cd "$workdir"
    ${COMMAND} >&2
)
