#!/bin/bash

if [ ! -z "$DOCKER_FILE_TEST_EXISTS" ]; then
	if [ -f "$DOCKER_FILE_TEST_EXISTS" ]; then
		echo "backup"
		sleep 5
		/backup.sh
	else
		echo "init"
		sleep 5
		/backup.sh
	fi
fi
