#!/usr/bin/env bash

echo 'Stopping the running Java application...'
echo 'Searching for the Java process ID...'
set -x
PID=$(pgrep -f "${NAME}-${VERSION}.jar")
set +x

echo 'Killing the Java process...'
set -x
kill "$PID"
set +x

echo 'Java application has been stopped.'