FROM centos:7.5.1804

LABEL maintainer="mozdef@mozilla.com"

RUN \
  mkdir /var/log/mozdef && \
  yum makecache fast && \
  yum install -y epel-release && \
  yum install -y nginx && \
  yum clean all


COPY files/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 9090
