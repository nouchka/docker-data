#!/bin/bash

TMP_DIR=/tmp
TMP_FILE=backup.tgz

##Password file generation
PASSWORD_FILE=/tmp/.rsync
echo $RSYNC_PASSWORD > $PASSWORD_FILE
chmod 400 $PASSWORD_FILE

cd $DOCKER_DATA_DIRECTORY

tar czPf $TMP_DIR/$TMP_FILE .

rsync -$RSYNC_FLAG --delete --password-file=$PASSWORD_FILE $TMP_DIR/$TMP_FILE $RSYNC_USER@$RSYNC_SERVER::$RSYNC_REPO/$RSYNC_FILE

if ! grep "^$DOCKER_DATA_USER" /etc/passwd >> /dev/null; then
	useradd -m -p ggt -s /bin/bash $DOCKER_DATA_USER
fi

chown -R $DOCKER_DATA_USER: $DOCKER_DATA_DIRECTORY

