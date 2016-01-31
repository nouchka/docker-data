FROM debian:jessie
MAINTAINER Jean-Avit Promis "docker@katagena.com"

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install mysql-client rsync tar && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY init.sh /init.sh
RUN chmod +x /init.sh

COPY backup.sh /backup.sh
RUN chmod +x /backup.sh

ENV DOCKER_DATA_DIRECTORY     /data
ENV RSYNC_REPO     backup
ENV RSYNC_FILE     file.tgz
ENV RSYNC_SERVER   server
ENV RSYNC_USER     user
ENV RSYNC_PASSWORD password

CMD /init.sh