FROM debian:stable-slim
MAINTAINER Jean-Avit Promis "docker@katagena.com"

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install default-mysql-client-core rsync tar wget cron jq && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY init.sh /init.sh
RUN chmod +x /init.sh

COPY backup.sh /backup.sh
RUN chmod +x /backup.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh

RUN touch /var/log/cron.log

ENV DOCKER_DATA_DIRECTORY     /data
ENV RSYNC_REPO     backup
ENV RSYNC_FILE     file.tgz
ENV RSYNC_SERVER   server
ENV RSYNC_USER     user
ENV RSYNC_PASSWORD password
ENV RSYNC_FLAG     azv
ENV CRON_BACKUP    * 6 * * *

WORKDIR /data/
VOLUME /data/

CMD /start.sh
