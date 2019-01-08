ARG VERSION="29"
FROM s390x/fedora:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# update to latest
RUN yum upgrade -y && \
    yum clean all && \
    rm -rf /var/cache/yum

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN groupadd -g ${gid} ${group} && \
    useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup sudo
RUN yum install -y sudo && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# install build-essential
RUN yum install -y autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 \
    ncurses-devel patch java-1.8.0-openjdk git && \
    yum clean all && \
    rm -rf /var/cache/yum

# Setup ccache
RUN yum install -y ccache && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /var/cache/ccache && \
    chown ${user}:${group} /var/cache/ccache && \
    chmod 2777 /var/cache/ccache
COPY ccache.conf /etc/ccache.conf

# setup SSH server
RUN yum install -y openssh-server && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
    sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
