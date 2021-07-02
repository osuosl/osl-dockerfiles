#!/bin/bash
set -ex
docker build -t osuosl/fedora-s390x:32 --build-arg VERSION=32 .
docker build -t osuosl/fedora-s390x:33 --build-arg VERSION=33 .
docker build -t osuosl/fedora-s390x:34 --build-arg VERSION=34 .
docker tag osuosl/fedora-s390x:34 osuosl/fedora-s390x:latest
