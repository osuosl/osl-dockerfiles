FROM osuosl/gentoo:stage3-ppc64le
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'GENTOO_MIRRORS="http://gentoo.osuosl.org"' >> /etc/portage/make.conf
RUN echo 'FEATURES="parallel-fetch"' >> /etc/portage/make.conf
RUN echo 'CLEAN_DELAY=0' >> /etc/portage/make.conf
RUN echo 'MAKEOPTS="-j20"' >> /etc/portage/make.conf
RUN emerge-webrsync
RUN emerge -q app-portage/eix app-portage/gentoolkit-dev \
    app-portage/portage-utils dev-vcs/git app-editors/vim sys-apps/ed \
    sys-devel/bc
RUN rm -rf /usr/portage/distfiles/*
CMD ["/bin/bash"]
