#!/bin/bash
set -ex
docker build -t osuosl/debian-s390x:9 --build-arg VERSION=9 .
docker tag osuosl/debian-s390x:9 osuosl/debian-s390x:latest
docker build -t osuosl/debian-s390x:buster --build-arg VERSION=buster .
docker build -t osuosl/debian-s390x:unstable --build-arg VERSION=unstable .
