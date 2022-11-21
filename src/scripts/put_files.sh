#!/usr/bin/env sh

set -e

# shellcheck disable=SC2153
directory="${DIRECTORY}"
# shellcheck disable=SC2153
workdir="${WORKDIR}"
# shellcheck disable=SC2153
extract="${EXTRACT}"
# shellcheck disable=SC2153
stderr_file="${STDERR_FILE}"
# shellcheck disable=SC2153
stdout_file="${STDOUT_FILE}"

(
  if "$extract"; then
    cd "$directory"
    tar x
  fi
)
(
  cd "$workdir"
  [ "$stderr_file" != "-" ] && truncate -s 0 "$stderr_file"
  [ "$stdout_file" != "-" ] && truncate -s 0 "$stdout_file"

  # don't write anything to stdout, since that would get appended to the tar file
  if [ "$stderr_file" = "-" ] && [ "$stdout_file" = "-" ]; then
    # redirect stdout to stderr
    ${COMMAND} 1>&2
  elif [ "$stderr_file" != "-" ] && [ "$stdout_file" = "-" ]; then
    # stderr to file, stdout to stderr
    ( ${COMMAND} 2>"$stderr_file" ) 1>&2

  elif [ "$stderr_file" = "-" ] && [ "$stdout_file" != "-" ]; then
    # stdout to file
    ${COMMAND} 1>"$stdout_file"
  else
    # both files specified
    ${COMMAND} 1>>"$stdout_file" 2>>"$stderr_file"
  fi
)
