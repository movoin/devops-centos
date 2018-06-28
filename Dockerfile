#
# Docker Image      movoin/devops-centos
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    1.12.3
#

FROM        centos:7
MAINTAINER  Allen Luo <movoin@gmail.com>

ENV DOCKER_CONF_HOME    /opt/docker/

ENV APP_PATH            /app
ENV APP_USER            app
ENV APP_GROUP           app
ENV APP_UID             1000
ENV APP_GID             1000

COPY scripts/ /usr/local/bin/

COPY conf/ /opt/docker/

RUN set -x \
    && touch /_I_AM_DOCKER \
    && chmod -R +x /opt/docker/bin/* \
    && echo "export TERM=xterm" >> /root/.bashrc \
    && /usr/local/bin/docker-install \
        zip \
        unzip \
        bzip2 \
        wget \
        curl \
        dnsutils \
        bind-utils \
        cronie \
        logrotate \
        supervisor \
    # Install
    && /opt/docker/bin/install.sh \
    # Bootstrap
    && /opt/docker/bin/bootstrap.sh

ENTRYPOINT [ "/opt/docker/bin/entrypoint.sh" ]

CMD [ "supervisord" ]
