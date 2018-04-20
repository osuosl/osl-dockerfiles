#!/bin/bash
set -ex
docker build -t osuosl/debian-ppc64le:9 --build-arg VERSION=9 .
docker tag osuosl/debian-ppc64le:9 osuosl/debian-ppc64le:latest
docker build -t osuosl/debian-ppc64le:buster --build-arg VERSION=buster .
docker build -t osuosl/debian-ppc64le:unstable --build-arg VERSION=unstable .
