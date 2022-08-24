FROM quay.io/centos/centos:stream${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

ARG VERSION="8"
ARG PACKER_ARCH="amd64"
ARG PACKER_VER="1.7.10"
ARG OS_RELEASE="yoga"

RUN yum install -y epel-release centos-release-openstack-${OS_RELEASE} && \
    yum upgrade -y && \
    yum install -y wget git qemu-kvm unzip curl python3-openstackclient && \
    wget -q -O /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_${PACKER_ARCH}.zip && \
    unzip -d /usr/local/bin/ /tmp/packer.zip && \
    rm -f /tmp/packer.zip && \
    curl -L https://omnitruck.cinc.sh/install.sh | bash && \
    /opt/cinc/embedded/bin/gem install -N berkshelf && \
    ln -s /opt/cinc/embedded/bin/berks /usr/local/bin/berks && \
    ln -s /usr/libexec/qemu-kvm /usr/local/bin/qemu-kvm && \
    dnf clean all
