#!/bin/bash
set -ex
docker push osuosl/ubuntu-ppc64le-cuda:10.0
docker push osuosl/ubuntu-ppc64le-cuda:10.1
docker push osuosl/ubuntu-ppc64le-cuda:10.2
docker push osuosl/ubuntu-ppc64le-cuda:latest
docker push osuosl/ubuntu-ppc64le-cuda:10.0-cudnn7
docker push osuosl/ubuntu-ppc64le-cuda:10.1-cudnn7
docker push osuosl/ubuntu-ppc64le-cuda:10.2-cudnn7
