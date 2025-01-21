ARG VERSION="9.5"
FROM registry.access.redhat.com/ubi9/ubi:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN dnf upgrade -y && \
    dnf clean all && \
    rm -rf /var/cache/dnf

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME=${JENKINS_AGENT_HOME}

RUN groupadd -g ${gid} ${group} && \
    useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup sudo
RUN dnf install -y sudo && \
    dnf clean all && \
    rm -rf /var/cache/yum && \
	echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

# Install packages we need
RUN dnf install -y autoconf gcc gcc-c++ gettext make m4 patch ncurses-devel \
      java-21-openjdk git && \
    dnf clean all && \
    rm -rf /var/cache/yum

# Setup ccache
RUN dnf install -y ccache && \
    dnf clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /var/cache/ccache && \
    chown ${user}:${group} /var/cache/ccache && \
    chmod 2777 /var/cache/ccache
COPY ccache.conf /etc/ccache.conf

# Setup SSH server
RUN dnf install -y openssh-server && \
    dnf clean all && \
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
