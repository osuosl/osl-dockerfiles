#!/bin/bash
set -ex
docker build -t osuosl/ubuntu-s390x:16.04 --build-arg VERSION=16.04 .
docker build -t osuosl/ubuntu-s390x:18.04 --build-arg VERSION=18.04 .
docker build -t osuosl/ubuntu-s390x:20.04 --build-arg VERSION=20.04 .
docker tag osuosl/ubuntu-s390x:20.04 osuosl/ubuntu-s390x:latest
