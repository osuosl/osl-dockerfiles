#!/bin/bash
set -ex
docker push osuosl/ubuntu-s390x:16.04
docker push osuosl/ubuntu-s390x:18.04
docker push osuosl/ubuntu-s390x:latest
