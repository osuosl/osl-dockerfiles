#!/bin/bash
set -ex
docker push osuosl/fedora-ppc64le:26
docker push osuosl/fedora-ppc64le:27
docker push osuosl/fedora-ppc64le:28
docker push osuosl/fedora-ppc64le:latest
