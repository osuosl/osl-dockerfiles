# Single build container for OSL Packer image builds, for all architectures.
#
#   x86_64 (amd64) / aarch64 (arm64) -> AlmaLinux 9 + CentOS SIG OpenStack
#   ppc64le                          -> AlmaLinux 8 + OSL OpenStack repo
#                                       (RDO only ships ppc64le OpenStack for el8)
#
# The base image is selected automatically from the build architecture (BuildKit
# TARGETARCH), so a plain `docker build` on each native node -- or
# `docker build --platform linux/ppc64le ...` to cross-build -- produces the
# right image with no extra flags.
FROM almalinux:9 AS base-amd64
FROM almalinux:9 AS base-arm64
FROM almalinux:8 AS base-ppc64le

FROM base-${TARGETARCH}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

ARG OS_RELEASE="yoga"

# OSL OpenStack repo, used only on ppc64le (moved into place in the RUN below).
COPY osuosl-virt.repo /tmp/osuosl-virt.repo

# xorriso is used by packer-templates' bin/remaster_freebsd_iso.sh to embed an
# unattended installerconfig into the FreeBSD install ISO. Architecture-specific
# extras: ppc64le gets the OpenStack repo from OSL's mirror plus python36; aarch64
# needs the UEFI firmware (edk2-aarch64 / AAVMF) for FreeBSD's UEFI boot.
RUN dnf install -y epel-release && \
    if [ "$(uname -m)" = "ppc64le" ]; then \
        mv /tmp/osuosl-virt.repo /etc/yum.repos.d/osuosl-virt.repo; \
    else \
        rm -f /tmp/osuosl-virt.repo; \
        dnf install -y centos-release-openstack-${OS_RELEASE}; \
    fi && \
    dnf upgrade -y && \
    dnf install -y --allowerasing wget git qemu-kvm xorriso unzip curl \
        python3-openstackclient yum-utils gcc gcc-c++ make && \
    if [ "$(uname -m)" = "ppc64le" ]; then dnf install -y python36; fi && \
    if [ "$(uname -m)" = "aarch64" ]; then dnf install -y edk2-aarch64; fi && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    dnf install -y packer && \
    ln -s /usr/bin/packer /usr/local/bin/packer && \
    curl -L https://omnitruck.cinc.sh/install.sh | bash && \
    /opt/cinc/embedded/bin/gem install -N berkshelf && \
    ln -s /opt/cinc/embedded/bin/berks /usr/local/bin/berks && \
    ln -s /usr/libexec/qemu-kvm /usr/local/bin/qemu-kvm && \
    dnf remove -y gcc gcc-c++ make && \
    dnf clean all
