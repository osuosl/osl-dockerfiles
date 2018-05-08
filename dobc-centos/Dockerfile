FROM osuosl/centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=dobc
ARG group=dobc
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} \
    && useradd -d /home/dobc -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

RUN sed -i '/^tsflags=nodocs$/d' /etc/yum.conf

# install packages we need
RUN yum install -y vim nano emacs-nox wget less git man man-pages screen && \
    yum clean all

# reinstall these packages to get their man pages
RUN yum reinstall -y bash coreutils curl tar gzip procps-ng util-linux systemd gawk && \
    yum clean all

# setup sudo
RUN yum install -y sudo && \
    yum clean all && \
    echo "dobc ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# setup SSH server
RUN yum install -y openssh-server && yum clean all && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
    sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22 8080

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
