#!/bin/bash
set -ex
docker build -t osuosl/centos-ppc64le:7 .
docker tag osuosl/centos-ppc64le:7 osuosl/centos-ppc64le:latest
