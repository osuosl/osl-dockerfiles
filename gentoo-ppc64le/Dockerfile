FROM osuosl/gentoo:stage3-ppc64le
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf && /
    echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf && /
    echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf && /
    echo 'MAKEOPTS="-j20"' >> /etc/portage/make.conf
RUN emerge-webrsync && /
    emerge -q app-portage/eix app-portage/gentoolkit-dev \
    app-portage/portage-utils dev-vcs/git app-editors/vim sys-apps/ed \
    sys-devel/bc && /
    rm -rf /usr/portage/
CMD ["/bin/bash"]
