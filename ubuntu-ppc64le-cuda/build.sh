#!/bin/bash
set -ex
docker build -t osuosl/ubuntu-ppc64le-cuda:8.0 --build-arg VERSION=8.0-devel-ubuntu16.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:9.0 --build-arg VERSION=9.0-devel-ubuntu16.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:9.1 --build-arg VERSION=9.1-devel-ubuntu16.04 .
docker tag osuosl/ubuntu-ppc64le-cuda:9.1 osuosl/ubuntu-ppc64le-cuda:latest
docker build -t osuosl/ubuntu-ppc64le-cuda:8.0-cudnn6 --build-arg VERSION=8.0-cudnn6-devel-ubuntu16.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:8.0-cudnn7 --build-arg VERSION=8.0-cudnn7-devel-ubuntu16.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:9.0-cudnn7 --build-arg VERSION=9.0-cudnn7-devel-ubuntu16.04 .
docker build -t osuosl/ubuntu-ppc64le-cuda:9.1-cudnn7 --build-arg VERSION=9.1-cudnn7-devel-ubuntu16.04 .
