#
# Docker Image      movoin/devops-centos
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    18.09.0
#

FROM centos:7

ENV DOCKER_CONF_PATH    /docker

ENV APP_PATH            /app
ENV APP_USER            app
ENV APP_GROUP           app
ENV APP_UID             1000
ENV APP_GID             1000

COPY conf/              $DOCKER_CONF_PATH
COPY scripts/           /usr/local/bin/

RUN set -x \
    && touch /_I_AM_DOCKER \
    && chmod -R +x $DOCKER_CONF_PATH/bin/* /usr/local/bin/* \
    && /usr/local/bin/docker-install \
    zip \
    unzip \
    bzip2 \
    wget \
    curl \
    dnsutils \
    bind-utils \
    cronie \
    # Bootstrap
    && $DOCKER_CONF_PATH/bin/bootstrap.sh

ENTRYPOINT [ "/docker/bin/entrypoint.sh" ]

CMD [ "supervisord" ]
