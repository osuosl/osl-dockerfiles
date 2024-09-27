ARG VERSION="12"
FROM s390x/debian:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000
ARG JENKINS_AGENT_HOME=/home/${user}
ARG JDK_VER=17

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-${JDK_VER}-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME ${JENKINS_AGENT_HOME}

RUN groupadd -g ${gid} ${group} && \
    useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# Upgrade system
RUN apt-get update && \
    apt-get upgrade --no-install-recommends -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# setup sudo
RUN apt-get update && \
    apt-get install --no-install-recommends -y sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install build-essential
RUN apt-get update && \
    apt-get install --no-install-recommends -y autoconf binutils-doc bison \
    build-essential flex gettext ncurses-dev openjdk-${JDK_VER}-jdk git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup ccache
RUN apt-get update && \
    apt-get install --no-install-recommends -y ccache && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/cache/ccache && \
    chown ${user}:${group} /var/cache/ccache && \
    chmod 2777 /var/cache/ccache

COPY ccache.conf /etc/ccache.conf

# setup SSH server
RUN apt-get update && \
    apt-get install --no-install-recommends -y openssh-server  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
    sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
