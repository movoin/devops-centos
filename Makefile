MAKEFLAGS += --silent

DOCKER_REPO="movoin/devops-centos"

all: centos/6

publish: push/6

#
# image: movoin/devops-centos:6
#
centos/6:
	bash build.sh "${DOCKER_REPO}" 6

test/6:
	docker run -it --rm ${DOCKER_REPO}:6

run/6:
	docker run -it --rm ${DOCKER_REPO}:6 bash

push/6:
	docker push ${DOCKER_REPO}:6
