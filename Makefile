MAKEFLAGS += --silent

DOCKER_REPO="movoin/devops-centos"

all: centos

publish: push

#
# image: movoin/devops-centos
#
centos:
	bash build.sh "${DOCKER_REPO}"

test:
	docker run -it --rm ${DOCKER_REPO}

run:
	docker run -it --rm ${DOCKER_REPO} bash

push:
	docker push ${DOCKER_REPO}

clean:
	docker images | grep none | awk '{system("docker rmi "$3)}'
