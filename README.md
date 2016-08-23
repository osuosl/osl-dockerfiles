# OSL Dockerfiles

Dockerfiles for deploying/developing Python-based webapps and NodeJS-based
webapps.

**To use images created from these Dockerfiles visit [Our DockerHub
Organization](https://hub.docker.com/r/osuosl/)**

## Building and Testing

```
$ cd <image-name>
$ docker build --no-cache --pull -t osuosl/<image-name> .
[... docker build output ...]
$ docker run -it osuosl/<image-name> /bin/bash
[root@somehash] $ echo "I'm in a container!"
I'm in a container!
```

## Usage in Dockerfiles

Include this line in the top of your `Dockerfile` to use one of the images
described in the master branch of this repository.

```
FROM osuosl/<image-name>
```

## Updating DockerHub Images

```
$ docker tag osuosl/<image-name> osuosl/<image-name>
$ docker tag osuosl/<image-name> osuosl/<image-name>:version

$ docker login
[... enter credentials ...]
$ docker push osuosl/<image-name><:optional-specific-tag>
[... docker image is pushed to the cloud ...]
```
