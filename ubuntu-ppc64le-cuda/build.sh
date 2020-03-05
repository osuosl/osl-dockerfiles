#!/bin/bash
set -ex
docker build -t osuosl/ubuntu-ppc64le-cuda:10.0 --build-arg VERSION=10.0-devel-ubuntu18.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:10.1 --build-arg VERSION=10.0-devel-ubuntu18.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:10.2 --build-arg VERSION=10.2-devel-ubuntu18.04 .
docker tag osuosl/ubuntu-ppc64le-cuda:10.2 osuosl/ubuntu-ppc64le-cuda:latest
docker build -t osuosl/ubuntu-ppc64le-cuda:10.0-cudnn7 --build-arg VERSION=10.0-cudnn7-devel-ubuntu18.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:10.1-cudnn7 --build-arg VERSION=10.1-cudnn7-devel-ubuntu18.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:10.2-cudnn7 --build-arg VERSION=10.2-cudnn7-devel-ubuntu18.04 .
