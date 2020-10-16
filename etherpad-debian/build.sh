#!/bin/bash
set -ex
ETHERPAD_PLUGINS=""
docker build . --build-arg ETHERPAD_PLUGINS="$ETHERPAD_PLUGINS" --tag osuosl/etherpad
