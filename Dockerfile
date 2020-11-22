From ubuntu:latest
MAINTAINER Benjamin Perdrijau

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update && apt-get -y dist-upgrade \
    && apt-get -y install supervisor postfix sasl2-bin opendkim opendkim-tools rsyslog \
    && apt-get -y autoremove --purge \
    && apt-get -y clean

# Add files
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
