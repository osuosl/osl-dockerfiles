FROM centos:latest
MAINTAINER support@osuosl.org

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y groupinstall "Development Tools"
RUN yum -y install python-pip python34 python-devel virtualenv python34

RUN pip install Django
CMD ["python", "-m", "django", "--version"]
