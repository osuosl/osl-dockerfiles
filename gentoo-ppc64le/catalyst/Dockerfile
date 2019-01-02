FROM osuosl/gentoo:stage3-ppc64le
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"
RUN echo 'dev-util/catalyst **' >> /etc/portage/package.keywords && \
    echo 'dev-python/pydecomp **' >> /etc/portage/package.keywords && \
    echo 'app-arch/pixz' >> /etc/portage/package.keywords && \
    echo 'dev-util/catalyst ccache' >> /etc/portage/package.use && \
    echo 'dev-libs/libpcre2 jit' >> /etc/portage/package.use

RUN emerge-webrsync && \
    emerge -q dev-util/catalyst app-arch/pixz && \
    rm -rf /usr/portage/
CMD ["/bin/bash"]
