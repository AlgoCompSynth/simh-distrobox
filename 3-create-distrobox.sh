#! /usr/bin/env bash

set -e

echo "Creating OpenSIMH distrobox"
distrobox create \
  --name OpenSIMH \
  --home $HOME/OpenSIMH \
  --image localhost/open-simh:latest

echo "Finished"
