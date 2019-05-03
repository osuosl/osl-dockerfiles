#!/bin/bash
set -ex
docker build -t osuosl/fedora-ppc64le:28 --build-arg VERSION=28 .
docker build -t osuosl/fedora-ppc64le:29 --build-arg VERSION=29 .
docker build -t osuosl/fedora-ppc64le:30 --build-arg VERSION=30 .
docker tag osuosl/fedora-ppc64le:30 osuosl/fedora-ppc64le:latest
