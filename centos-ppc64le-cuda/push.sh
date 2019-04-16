#!/bin/bash
set -ex
docker push osuosl/centos-ppc64le-cuda:8.0
docker push osuosl/centos-ppc64le-cuda:9.0
docker push osuosl/centos-ppc64le-cuda:9.1
docker push osuosl/centos-ppc64le-cuda:9.2
docker push osuosl/centos-ppc64le-cuda:10.0
docker push osuosl/centos-ppc64le-cuda:10.1
docker push osuosl/centos-ppc64le-cuda:latest
docker push osuosl/centos-ppc64le-cuda:8.0-cudnn6
docker push osuosl/centos-ppc64le-cuda:8.0-cudnn7
docker push osuosl/centos-ppc64le-cuda:9.0-cudnn7
docker push osuosl/centos-ppc64le-cuda:9.1-cudnn7
docker push osuosl/centos-ppc64le-cuda:9.2-cudnn7
docker push osuosl/centos-ppc64le-cuda:10.0-cudnn7
docker push osuosl/centos-ppc64le-cuda:10.1-cudnn7
