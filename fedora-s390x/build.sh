#!/bin/bash
set -ex
docker build -t osuosl/fedora-s390x:28 --build-arg VERSION=28 .
docker build -t osuosl/fedora-s390x:29 --build-arg VERSION=29 .
docker tag osuosl/fedora-s390x:29 osuosl/fedora-s390x:latest
