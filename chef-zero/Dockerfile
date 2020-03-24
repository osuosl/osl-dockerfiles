FROM centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

ARG CHANNEL=stable
ARG VERSION=15.8.23
ARG CHEF_PORT=8889
ARG CHEF_HOST=0.0.0.0
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chef/bin:/opt/chef/embedded/bin \
    LANG=en_US.UTF-8 \
    CHEF_REPO_PATH=/tmp/chef \
    CHEF_PORT=$CHEF_PORT \
    CHEF_HOST=$CHEF_HOST

# Install chef-client
RUN yum install -y "https://packages.chef.io/files/${CHANNEL}/chef/${VERSION}/el/7/chef-${VERSION}-1.el7.x86_64.rpm"

# Configure Chef Client
USER nobody
RUN mkdir -p $CHEF_REPO_PATH
WORKDIR $CHEF_REPO_PATH
EXPOSE $CHEF_PORT
ENTRYPOINT /opt/chef/embedded/bin/chef-zero -H $CHEF_HOST -p $CHEF_PORT -l info
