FROM centos:centos6

MAINTAINER OSU Open Source Lab, support@osuosl.org

EXPOSE 80

RUN yum groupinstall -y 'Development Tools'
RUN yum install -y epel-release
RUN yum install -y python-devel python-setuptools gcc curl \
                   libffi-devel openssl-devel nginx python-meld3
RUN /etc/init.d/nginx start

# Install the ius repository so other images can easily install packages without
# needing to set up ius
RUN curl https://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-14.ius.centos6.noarch.rpm > /tmp/ius.rpm
RUN yum install -y /tmp/ius.rpm

RUN easy_install pip
RUN pip install supervisor gunicorn
RUN echo_supervisord_conf > /etc/supervisord.conf
RUN printf "[include] \nfiles = /etc/supervisor.d/*.conf" >> /etc/supervisord.conf
COPY files/nginx.conf /etc/nginx/conf.d/app.conf
RUN rm -f /etc/nginx/conf.d/default.conf
COPY files/gunicorn.conf /opt/app/conf/gunicorn_config.py
COPY files/supervisor.conf /etc/supervisor.d/app.conf

WORKDIR /opt/app/src
CMD bash -c "nginx && supervisord && tail -f /var/log/nginx/access.log"
