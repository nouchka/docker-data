#!/bin/bash

TMP_DIR=/tmp

##Password file generation
PASSWORD_FILE=/tmp/.rsync
echo $RSYNC_PASSWORD > $PASSWORD_FILE
chmod 400 $PASSWORD_FILE

rsync -azv --delete --password-file=$PASSWORD_FILE $RSYNC_USER@$RSYNC_SERVER::$RSYNC_REPO/$RSYNC_FILE $TMP_DIR

tar xzvf $TMP_DIR/$RSYNC_FILE -C $DOCKER_DATA_DIRECTORY
