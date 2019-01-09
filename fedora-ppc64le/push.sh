#!/bin/bash
set -ex
docker push osuosl/fedora-ppc64le:28
docker push osuosl/fedora-ppc64le:29
docker push osuosl/fedora-ppc64le:latest
