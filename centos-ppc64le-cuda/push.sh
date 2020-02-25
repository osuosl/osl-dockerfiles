#!/bin/bash
set -ex
docker push osuosl/centos-ppc64le-cuda:10.0
docker push osuosl/centos-ppc64le-cuda:10.1
docker push osuosl/centos-ppc64le-cuda:latest
docker push osuosl/centos-ppc64le-cuda:10.0-cudnn7
docker push osuosl/centos-ppc64le-cuda:10.1-cudnn7
