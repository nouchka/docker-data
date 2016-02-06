#!/bin/bash

TMP_DIR=/tmp

##Password file generation
PASSWORD_FILE=/tmp/.rsync
echo $RSYNC_PASSWORD > $PASSWORD_FILE
chmod 400 $PASSWORD_FILE

rsync -azv --delete --password-file=$PASSWORD_FILE $RSYNC_USER@$RSYNC_SERVER::$RSYNC_REPO/$RSYNC_FILE $TMP_DIR

rm -rf $DOCKER_DATA_DIRECTORY

mkdir -p $DOCKER_DATA_DIRECTORY

tar xzvf $TMP_DIR/$RSYNC_FILE -C $DOCKER_DATA_DIRECTORY

if ! grep "^$DOCKER_DATA_USER" /etc/passwd >> /dev/null; then
	useradd -m -p ggt -s /bin/bash $DOCKER_DATA_USER
fi

chown -R $DOCKER_DATA_USER: $DOCKER_DATA_DIRECTORY
