#! /usr/bin/env bash

set -e

echo "Downloading source from GitHub"
rm --force --recursive simh*
git clone https://github.com/open-simh/simh.git
echo "Finished"
