FROM gentoo/stage3-amd64
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf && \
    echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf && \
    echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf && \
    echo 'MAKEOPTS="-j16"' >> /etc/portage/make.conf && \
    mkdir -p /etc/portage/package.accept_keywords && \
    echo 'app-arch/pigz' >> /etc/portage/package.accept_keywords/pigz
RUN emerge-webrsync && \
    emerge -q app-portage/eix app-portage/gentoolkit-dev \
    app-portage/portage-utils dev-vcs/git app-editors/vim sys-apps/ed \
    sys-devel/bc app-arch/pigz && \
    rm -rf /usr/portage
CMD ["/bin/bash"]
