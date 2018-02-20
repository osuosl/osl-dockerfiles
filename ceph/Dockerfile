FROM ceph/demo:tag-build-master-luminous-centos-7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN yum -y upgrade ceph* && yum clean all && rm -rf /var/cache/yum
RUN sed -ie 's/\[client.restapi\]/\[client.admin\]/' /entrypoint.sh
RUN sed -ie 's/\(ceph ${CLI_OPTS} osd pool set rbd size 1\)/ceph ${CLI_OPTS} osd pool create rbd 128\n\1/' /entrypoint.sh
