#!/bin/bash
set -ex
ETHERPAD_PLUGINS=""
docker build . --build-arg ETHERPAD_PLUGINS="$ETHERPAD_PLUGINS" --tag osuosl/etherpad
DATE_VER="$(date -u +%Y.%m.%d.%H%M)"
docker tag osuosl/etherpad osuosl/etherpad:1.8.6-${DATE_VER}
