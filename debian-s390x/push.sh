#!/bin/bash
set -ex
docker push osuosl/debian-s390x:9
docker push osuosl/debian-s390x:10
docker push osuosl/debian-s390x:latest
docker push osuosl/debian-s390x:bullseye
docker push osuosl/debian-s390x:unstable
