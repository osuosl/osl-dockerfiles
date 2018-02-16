ARG CENTOS_VER="systemd"
FROM osuosl/centos:${CENTOS_VER}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
ARG GANETI_VERSION="2.15"

COPY ganeti.repo /etc/yum.repos.d/ganeti.repo
COPY ganeti-instance-image.repo /etc/yum.repos.d/ganeti-instance-image.repo

RUN yum install -y yum-plugin-versionlock && \
    yum versionlock ganeti-${GANETI_VERSION}* && \
    yum install -y ganeti ganeti-instance-image net-tools openssh-server \
        initscripts && \
    yum clean all && rm -rf /var/cache/yum && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh

COPY cirros.conf /etc/ganeti/instance-image/variants/cirros.conf
COPY ganeti-instance-image /etc/default/ganeti-instance-image
COPY variants.list /etc/ganeti/instance-image/variants.list

EXPOSE 22 1811 5080
CMD ["/sbin/init"]
