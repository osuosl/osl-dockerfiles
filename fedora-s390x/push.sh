#!/bin/bash
set -ex
docker push osuosl/fedora-s390x:32
docker push osuosl/fedora-s390x:33
docker push osuosl/fedora-s390x:34
docker push osuosl/fedora-s390x:latest
