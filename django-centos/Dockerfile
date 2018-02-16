FROM osuosl/centos:latest
MAINTAINER MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

RUN yum -y groupinstall "Development Tools" && \
    yum -y install python-pip python34 python-devel virtualenv python34 && \
    pip install --upgrade pip && \
    pip install 'Django<2.0.0'

CMD ["python", "-m", "django", "--version"]
