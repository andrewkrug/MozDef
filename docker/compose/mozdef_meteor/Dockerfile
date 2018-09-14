FROM centos:7.5.1804
LABEL maintainer="mozdef@mozilla.com"

ENV METEOR_VERSION 1.7.0.5

ENV MONGO_URL=mongodb://mongodb:3002/meteor
ENV ROOT_URL=http://localhost
ENV PORT=3000

RUN \
  useradd -ms /bin/bash -d /opt/mozdef -m mozdef && \
  mkdir -p /opt/mozdef/envs/mozdef && \
  cd /opt/mozdef && \
  chown -R mozdef:mozdef /opt/mozdef && \
  yum install -y \
                wget \
                make \
                glibc-devel \
                gcc \
                gcc-c++ \
                libstdc++ \
                libffi-devel \
                zlib-devel && \
  mkdir /opt/mozdef/meteor && \
  curl -sL -o /opt/mozdef/meteor.tar.gz https://static-meteor.netdna-ssl.com/packages-bootstrap/$METEOR_VERSION/meteor-bootstrap-os.linux.x86_64.tar.gz && \
  tar -xzf /opt/mozdef/meteor.tar.gz -C /opt/mozdef/meteor && \
  mv /opt/mozdef/meteor/.meteor /opt/mozdef && \
  rm -r /opt/mozdef/meteor && \
  cp /opt/mozdef/.meteor/packages/meteor-tool/*/mt-os.linux.x86_64/scripts/admin/launch-meteor /usr/bin/meteor

COPY meteor /opt/mozdef/envs/mozdef/meteor
COPY docker/compose/mozdef_meteor/files/settings.js /opt/mozdef/meteor/app/lib/settings.js

USER mozdef
RUN \
  cd /opt/mozdef/meteor && \
  meteor npm install


WORKDIR /opt/mozdef/mozdef

EXPOSE 3000
