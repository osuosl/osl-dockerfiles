#!/bin/bash
set -ex
docker build -t osuosl/fedora-ppc64le:28 --build-arg VERSION=28 .
docker build -t osuosl/fedora-ppc64le:29 --build-arg VERSION=29 .
docker tag osuosl/fedora-ppc64le:29 osuosl/fedora-ppc64le:latest
