FROM centos:6
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY epel.repo /etc/yum.repos.d/epel.repo

RUN yum upgrade -y && \
    yum install -y vim nano emacs-nox wget less git && \
    yum clean all && \
    rm -rf /var/cache/yum
