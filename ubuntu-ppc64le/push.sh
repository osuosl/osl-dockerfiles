#!/bin/bash
set -ex
docker push osuosl/ubuntu-ppc64le:16.04
docker push osuosl/ubuntu-ppc64le:18.04
docker push osuosl/ubuntu-ppc64le:latest
