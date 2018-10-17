#!/bin/bash
set -ex
docker build -t osuosl/fedora-ppc64le:26 --build-arg VERSION=26 .
docker build -t osuosl/fedora-ppc64le:27 --build-arg VERSION=27 .
docker build -t osuosl/fedora-ppc64le:28 --build-arg VERSION=28 .
docker tag osuosl/fedora-ppc64le:28 osuosl/fedora-ppc64le:latest
