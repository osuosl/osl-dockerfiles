#!/bin/bash
set -ex
docker push ubuntu-ppc64le-cuda:8.0
docker push ubuntu-ppc64le-cuda:9.0
docker push ubuntu-ppc64le-cuda:9.1
docker push ubuntu-ppc64le-cuda:latest
docker push ubuntu-ppc64le-cuda:8.0-cudnn6
docker push ubuntu-ppc64le-cuda:8.0-cudnn7
docker push ubuntu-ppc64le-cuda:9.0-cudnn7
docker push ubuntu-ppc64le-cuda:9.1-cudnn7
