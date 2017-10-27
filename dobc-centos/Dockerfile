FROM centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=dobc
ARG group=dobc
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} \
    && useradd -d /home/dobc -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"
RUN echo dobcadmin123 | passwd "${user}" --stdin

RUN sed -i '/^tsflags=nodocs$/d' /etc/yum.conf
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY epel.repo /etc/yum.repos.d/epel.repo

# install packages we need
RUN yum install -y vim wget less git man man-pages \
    && yum clean all

# setup sudo
RUN yum install -y sudo && yum clean all
RUN echo "dobc ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# setup SSH server
RUN yum install -y openssh-server \
    && yum clean all
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config
RUN sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
