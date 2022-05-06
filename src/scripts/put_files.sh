#!/usr/bin/env sh

set -e

directory="${DIRECTORY}"
workdir="${WORKDIR}"
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
