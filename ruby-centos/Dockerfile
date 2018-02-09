FROM osuosl/centos:7
MAINTAINER MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN yum -y groupinstall "Development Tools" && \
    yum -y install openssl zlib-devel openssl-devel && yum clean all

WORKDIR /tmp/

RUN curl https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz -o /tmp/ruby-2.3.0.tar.gz && \
    echo "ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507 /tmp/ruby-2.3.0.tar.gz" > \
    /tmp/ruby-2.3.0-sha256sum && \
    sha256sum -c /tmp/ruby-2.3.0-sha256sum && \
    tar xf /tmp/ruby-2.3.0.tar.gz && \
    /tmp/ruby-2.3.0/configure && \
    make && \
    make install && \
    rm -rf /tmp/*

WORKDIR /

CMD ruby --version
