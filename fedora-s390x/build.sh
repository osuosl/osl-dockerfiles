#!/bin/bash
set -ex
docker build -t osuosl/fedora-s390x:28 --build-arg VERSION=28 .
docker build -t osuosl/fedora-s390x:29 --build-arg VERSION=29 .
docker build -t osuosl/fedora-s390x:30 --build-arg VERSION=30 .
docker tag osuosl/fedora-s390x:30 osuosl/fedora-s390x:latest
