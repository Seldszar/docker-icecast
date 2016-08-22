FROM buildpack-deps:jessie

# Set environment variables
ENV GOSU_VERSION 1.7
ENV ICECAST_VERSION 2.4.3

# Install GOSU
RUN set -x \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
  && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
  && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
  && export GNUPGHOME="$(mktemp -d)" \
  && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
  && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
  && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu \
  && gosu nobody true \
  && apt-get purge -y --auto-remove ca-certificates

# Install Icecast dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends libspeex-dev libtheora-dev libvorbis-dev mime-support \
  && rm -rf /var/lib/apt/lists/*

# Download, compile and install Icecast
RUN wget "http://downloads.xiph.org/releases/icecast/icecast-$ICECAST_VERSION.tar.gz" \
  && tar -xzf "icecast-$ICECAST_VERSION.tar.gz" \
  && cd "icecast-$ICECAST_VERSION" \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -r "icecast-$ICECAST_VERSION"

# Configure Icecast user
RUN adduser --disabled-password --gecos '' icecast2

# Copy files into container
COPY docker-entrypoint.sh /

# Setup Docker entrypoint
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Launch Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
