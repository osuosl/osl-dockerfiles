#!/bin/bash
set -ex
docker build -t osuosl/debian-ppc64le:9 --build-arg VERSION=9 --build-arg JDK_VER=8 .
docker build -t osuosl/debian-ppc64le:10 --build-arg VERSION=10 .
docker tag osuosl/debian-ppc64le:10 osuosl/debian-ppc64le:latest
docker build -t osuosl/debian-ppc64le:bullseye --build-arg VERSION=bullseye .
docker build -t osuosl/debian-ppc64le:unstable --build-arg VERSION=unstable .
