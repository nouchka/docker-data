DOCKER_IMAGE=data

include Makefile.docker

.PHONY: check-version
check-version:
	docker run --rm --entrypoint dpkg $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) -l| grep rsync|awk '{print $$3}'
