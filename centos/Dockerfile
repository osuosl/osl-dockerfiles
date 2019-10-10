ARG VERSION="8"
FROM centos:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

COPY fix-repos.sh /root/fix-repos.sh
COPY fix-epel.sh /root/fix-epel.sh

RUN bash /root/fix-repos.sh && rm -rf /root/fix-repos.sh && \
    yum install -y epel-release && bash /root/fix-epel.sh && rm -rf /root/fix-epel.sh && \
    yum upgrade -y && \
    yum install -y vim nano emacs-nox wget less git && \
    yum clean all && \
    rm -rf /var/cache/yum
