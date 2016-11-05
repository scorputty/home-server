FROM gliderlabs/alpine:3.2
MAINTAINER http://gliderlabs.viewdocs.io/docker-alpine
ARG GITTAG=1.1.0

RUN buildDeps="gcc g++ git mercurial make automake autoconf python-dev openssl-dev libffi-dev musl-dev" \
  && apk --update add $buildDeps \
  && apk add \
    python \
    py-pip \
    ffmpeg-libs \
    ffmpeg \
    unrar \
    openssl \
    ca-certificates \
    p7zip \
&& pip install --upgrade pip --no-cache-dir \
&& pip install pyopenssl cheetah --no-cache-dir \
&& git clone --depth 1 https://github.com/Parchive/par2cmdline.git \
&& cd /par2cmdline \
&& aclocal \
&& automake --add-missing \
&& autoconf \
&& ./configure \
&& make \
&& make install \
&& cd / \
&& rm -rf par2cmdline \
&& git clone --depth 1 --branch ${GITTAG} https://github.com/sabnzbd/sabnzbd.git \
&& hg clone https://bitbucket.org/dual75/yenc \
&& cd /yenc \
&& python setup.py build \
&& python setup.py install \
&& cd / \
&& rm -rf /yenc \
&& apk del $buildDeps \
&& rm -rf \
    /var/cache/apk/* \
    /par2cmdline \
    /yenc \
    /sabnzbd/.git \
    /tmp/*

EXPOSE 8080

VOLUME ["/config", "/data"]

WORKDIR /sabnzbd

# add user for media
# RUN useradd -u 800 media

# add the startup script
ADD start.sh /start.sh
RUN chmod +x /start.sh

# switch to user media
USER media

# ususally runs on 8080
EXPOSE 8080

# CMD can be easily overwritten for debugging
CMD ["/start.sh"]
