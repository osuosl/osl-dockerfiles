FROM ppc64le/centos:7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup Java
RUN yum install -y java-1.8.0-openjdk && yum clean all

# install git
RUN yum install -y git && yum clean all

# setup sudo
RUN yum install -y sudo && yum clean all
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# install build-essential
RUN yum install -y autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch && yum clean all

# setup SSH server
RUN yum install -y openssh-server \
    && yum clean all
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config
RUN sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
