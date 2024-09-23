#!/bin/bash
set -ex
docker build -t osuosl/debian-s390x:12 --build-arg VERSION=12 .
docker tag osuosl/debian-s390x:12 osuosl/debian-s390x:latest
