#! /usr/bin/env bash

set -e

echo "Building open-simh"
podman build -t open-simh .

echo "Finished"
