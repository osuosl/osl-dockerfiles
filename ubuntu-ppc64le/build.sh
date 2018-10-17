#!/bin/bash
set -ex
docker build -t osuosl/ubuntu-ppc64le:16.04 --build-arg VERSION=16.04 .
docker build -t osuosl/ubuntu-ppc64le:18.04 --build-arg VERSION=18.04 .
docker tag osuosl/ubuntu-ppc64le:18.04 osuosl/ubuntu-ppc64le:latest
