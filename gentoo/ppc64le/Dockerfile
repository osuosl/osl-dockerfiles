# This Dockerfile creates a gentoo stage3 container image. By default it
# creates a stage3-ppc64le image. It utilizes a multi-stage build and requires
# docker-17.05.0 or later. It fetches a daily snapshot from the official
# sources and verifies its checksum as well as its gpg signature.

# As gpg keyservers sometimes are unreliable, we use multiple gpg server pools
# to fetch the signing key.

ARG BOOTSTRAP
FROM ${BOOTSTRAP:-ppc64le/alpine:3.7} as builder

WORKDIR /gentoo

ARG ARCH=ppc64le
ARG MICROARCH=power8le
ARG SUFFIX="-latest"
ARG DIST="https://ftp.osuosl.org/pub/osl/openpower/gentoo/releases"
ARG SIGNING_KEY="0x2DF30655A70B13B7"
ARG STAGE3="stage3-${MICROARCH}${SUFFIX}.tar.xz"

RUN echo "Building Gentoo Container image for ${ARCH} ${SUFFIX} fetching from ${DIST}" \
 && apk --no-cache add gnupg tar wget xz \
 && wget -q "${DIST}/${STAGE3}" "${DIST}/${STAGE3}.CONTENTS" "${DIST}/${STAGE3}.DIGESTS.asc" \
 && gpg --list-keys \
 && echo "standard-resolver" >> ~/.gnupg/dirmngr.conf \
 && echo "honor-http-proxy" >> ~/.gnupg/dirmngr.conf \
 && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
 && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys ${SIGNING_KEY} \
 && gpg --verify "${STAGE3}.DIGESTS.asc" \
 && awk '/# SHA512 HASH/{getline; print}' ${STAGE3}.DIGESTS.asc | sha512sum -c \
 && tar xpf "${STAGE3}" --xattrs --numeric-owner \
 && echo 'UTC' > etc/timezone \
 && rm ${STAGE3}.DIGESTS.asc ${STAGE3}.CONTENTS ${STAGE3}

FROM scratch

WORKDIR /
COPY --from=builder /gentoo/ /
COPY overlays/ /usr/local/overlay
RUN echo 'PORTDIR_OVERLAY=/usr/local/overlay' >> /etc/portage/make.conf
CMD ["/bin/bash"]
