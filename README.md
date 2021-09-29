# docker-data
[![Docker pull](https://img.shields.io/docker/pulls/nouchka/data)](https://hub.docker.com/r/nouchka/data/)
[![Docker stars](https://img.shields.io/docker/stars/nouchka/data)](https://hub.docker.com/r/nouchka/data/)
[![Build Status](https://gitlab.com/japromis/docker-data/badges/master/pipeline.svg)](https://gitlab.com/japromis/docker-data/pipelines)
[![Docker size](https://img.shields.io/docker/image-size/nouchka/data/latest)](https://hub.docker.com/r/nouchka/data/)

env DOCKER_DATA_DIRECTORY specify target directory where content will be untar for init and tar for backup.

Directory must be in VOLUME from the main image to be persistant and avalaible.
