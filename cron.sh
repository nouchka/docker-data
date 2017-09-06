#!/bin/bash

mkdir -p /etc/cron.d/
echo "$CRON_BACKUP	root	/backup.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/backup
chmod 0644 /etc/cron.d/backup

cron && tail -f /var/log/cron.log
