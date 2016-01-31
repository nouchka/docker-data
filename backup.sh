#!/bin/bash

TMP_DIR=/tmp
TMP_FILE=backup.tgz

##Password file generation
PASSWORD_FILE=/tmp/.rsync
echo $RSYNC_PASSWORD > $PASSWORD_FILE
chmod 400 $PASSWORD_FILE

cd $DOCKER_DATA_DIRECTORY

tar czPf $TMP_DIR/$TMP_FILE .

rsync -azv --delete --password-file=$PASSWORD_FILE $TMP_DIR/$TMP_FILE $RSYNC_USER@$RSYNC_SERVER::$RSYNC_REPO/$RSYNC_FILE
