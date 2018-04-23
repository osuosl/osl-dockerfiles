#!/bin/bash
set -ex
docker push osuosl/debian-s390x:9
docker push osuosl/debian-s390x:latest
docker push osuosl/debian-s390x:buster
docker push osuosl/debian-s390x:unstable
