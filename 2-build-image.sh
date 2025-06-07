#! /usr/bin/env bash

set -e

echo "Building open-simh"
docker build -t open-simh .

echo "Finished"
