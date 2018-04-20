#!/bin/bash
set -ex
docker push osuosl/debian-ppc64le:9
docker push osuosl/debian-ppc64le:latest
docker push osuosl/debian-ppc64le:buster
docker push osuosl/debian-ppc64le:unstable
