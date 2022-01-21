#!/bin/bash
set -ex
docker build . --tag osuosl/redmine-replicant
DATE_VER="$(date -u +%Y.%m.%d.%H%M)"
docker tag osuosl/redmine-replicant osuosl/redmine-replicant:4.2.3-${DATE_VER}
