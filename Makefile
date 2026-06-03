DOCKER_IMAGE?=dockette/candoo
DOCKER_TAG?=latest

.PHONY: build test run

build:
	docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} php -v
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} caddy -version

run:
	docker run --rm -it -p 8080:2015 -v "$${PWD}:/srv:delegated" ${DOCKER_IMAGE}:${DOCKER_TAG}
