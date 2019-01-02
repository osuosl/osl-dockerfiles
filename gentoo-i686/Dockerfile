FROM gentoo/stage3-x86-hardened
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf && \
    echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf && \
    echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf && \
    echo 'MAKEOPTS="-j16"' >> /etc/portage/make.conf && \
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
    =sys-devel/gcc-8.2* dev-libs/elfutils && \
    gcc-config i686-pc-linux-gnu-8.2.0 && \
    rm -rf /usr/portage
CMD ["/bin/bash"]
