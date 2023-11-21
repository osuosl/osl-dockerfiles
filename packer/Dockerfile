ARG VERSION="8"

FROM almalinux:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

ARG OS_RELEASE="xena"

RUN yum install -y epel-release centos-release-openstack-${OS_RELEASE} && \
    yum upgrade -y && \
    yum install -y wget git qemu-kvm unzip curl python3-openstackclient \
        yum-utils gcc gcc-c++ make && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    yum install -y packer && \
    ln -s /usr/bin/packer /usr/local/bin/packer && \
    curl -L https://omnitruck.cinc.sh/install.sh | bash && \
    /opt/cinc/embedded/bin/gem install -N berkshelf && \
    ln -s /opt/cinc/embedded/bin/berks /usr/local/bin/berks && \
    ln -s /usr/libexec/qemu-kvm /usr/local/bin/qemu-kvm && \
    dnf remove -y gcc gcc-c++ make && \
    dnf clean all
