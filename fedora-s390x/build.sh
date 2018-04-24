#!/bin/bash
set -ex
docker build -t osuosl/fedora-s390x:28 .
docker tag osuosl/fedora-s390x:28 osuosl/fedora-s390x:latest
