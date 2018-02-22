# Base image
FROM gliderlabs/alpine:3.6

# Information
LABEL maintainer="FrozenFOXX <frozenfoxx@churchoffoxx.net>"

# Variables
ENV BIND_KEYS_SRC="https://ftp.isc.org/isc/bind9/keys/9.11/bind.keys.v9_11"
ENV CONFIG="default"

# Install/update packages
RUN apk -U upgrade && \
    apk add bind \
      openssl

# Set up bind directories, get latest bind.keys
RUN mkdir -m 0770 -p /etc/bind && \
    chown -R root:named /etc/bind && \
    mkdir -m 0770 -p /src/configs && \
    chown -R root:named /src/configs && \
    mkdir -m 0770 -p /var/bind && \
    chown -R root:named /var/cache

RUN wget -q -O /etc/bind/bind.keys ${BIND_KEYS_SRC}
RUN rndc-confgen -a -r /dev/urandom

# Add scripts and configs
COPY bin/* /usr/local/bin/
COPY configs/ /src/configs/

# Set exports and data volumes
EXPOSE  53 53/udp
VOLUME  [ "/etc/bind" ]
VOLUME  [ "/var/bind" ]
WORKDIR /etc/bind

# Run the server
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
