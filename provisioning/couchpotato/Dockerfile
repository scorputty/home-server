FROM gliderlabs/alpine:latest
MAINTAINER http://gliderlabs.viewdocs.io/docker-alpine

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk add --update \
        ca-certificates \
        git \
        python \
        python-dev \
        py-pip \
        build-base \
        py-libxml2 \
        py-lxml \
        make \
        gcc \
        g++ \
        python-dev \
        openssl-dev \
        libffi-dev \
    && pip install --upgrade pip \
    && pip --no-cache-dir install --upgrade setuptools \
    && pip --no-cache-dir install --upgrade pyopenssl \
    && rm -rf /CouchPotatoServer \
    && git clone --depth 1 https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer \
    && apk del make gcc g++ python-dev \
    && rm -rf /tmp/src \
    && rm -rf /var/cache/apk/*

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]
