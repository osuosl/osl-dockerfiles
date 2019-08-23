FROM osuosl/gentoo:stage3-ppc64le
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf && \
    echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf && \
    echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf && \
    echo 'MAKEOPTS="-j20"' >> /etc/portage/make.conf && \
    mkdir -p /etc/portage/{package.accept_keywords,package.use} && \
    echo 'net-misc/dhcp -server' >> /etc/portage/package.use/dhcp && \
    echo 'dev-libs/libpcre2 jit' >> /etc/portage/package.use/libpcre2 && \
    echo 'app-arch/pigz' >> /etc/portage/package.accept_keywords/pigz && \
    echo 'sys-kernel/dracut' >> /etc/portage/package.accept_keywords/dracut && \
    echo 'sys-devel/gcc **' >> /etc/portage/package.accept_keywords/gcc
RUN emerge-webrsync && \
    emerge -q app-portage/eix app-portage/gentoolkit app-portage/repoman \
    app-portage/portage-utils dev-vcs/git app-editors/vim sys-apps/ed \
    sys-devel/bc app-arch/pigz net-misc/dhcp net-fs/nfs-utils \
    sys-fs/lvm2 sys-fs/mdadm sys-fs/multipath-tools sys-kernel/dracut \
    =sys-devel/gcc-9.2* dev-libs/elfutils && \
    gcc-config powerpc64le-unknown-linux-gnu-9.2.0 && \
    rm -rf /usr/portage/
CMD ["/bin/bash"]
