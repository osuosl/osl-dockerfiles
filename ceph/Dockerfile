FROM ceph/demo:tag-build-master-luminous-centos-7
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN sed -ie 's/\[client.restapi\]/\[client.admin\]/' /entrypoint.sh
