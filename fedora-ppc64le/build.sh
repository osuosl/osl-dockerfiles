#!/bin/bash
set -ex
docker build -t osuosl/fedora-ppc64le:26 .
docker build -t osuosl/fedora-ppc64le:27 .
docker tag osuosl/fedora-ppc64le:27 osuosl/fedora-ppc64le:latest
