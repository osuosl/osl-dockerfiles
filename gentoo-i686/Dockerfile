FROM gentoo/stage3-x86
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf && \
    echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf && \
    echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf && \
    echo 'MAKEOPTS="-j16"' >> /etc/portage/make.conf && \
    mkdir -p /etc/portage/{package.accept_keywords,package.use} && \
    echo 'net-misc/dhcp -server' >> /etc/portage/package.use/dhcp && \
    echo 'app-arch/pigz' >> /etc/portage/package.accept_keywords/pigz && \
    echo 'sys-kernel/dracut' >> /etc/portage/package.accept_keywords/dracut
RUN emerge-webrsync && \
    emerge -q app-portage/eix app-portage/gentoolkit-dev app-portage/repoman \
    app-portage/portage-utils dev-vcs/git app-editors/vim sys-apps/ed \
    sys-devel/bc app-arch/pigz net-misc/dhcp net-fs/nfs-utils \
    sys-fs/lvm2 sys-fs/mdadm sys-fs/multipath-tools sys-kernel/dracut && \
    rm -rf /usr/portage
CMD ["/bin/bash"]
