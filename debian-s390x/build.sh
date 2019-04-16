#!/bin/bash
set -ex
docker build -t osuosl/debian-s390x:9 --build-arg VERSION=9 .
docker tag osuosl/debian-s390x:9 osuosl/debian-s390x:latest
docker build -t osuosl/debian-s390x:buster --build-arg VERSION=buster --build-arg JDK_VER=11 .
docker build -t osuosl/debian-s390x:unstable --build-arg VERSION=unstable --build-arg JDK_VER=11 .
