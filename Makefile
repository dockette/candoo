DOCKER_IMAGE?=dockette/candoo
DOCKER_TAG?=latest


.PHONY: build
build:
	docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} php -v
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} caddy version
	test "$$(docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} php -r 'echo ICONV_IMPL, " ", iconv("UTF-8", "ASCII//TRANSLIT", "Žluťoučký kůň");')" = "libiconv Zlutouck'y kun"

.PHONY: run
run:
	docker run --rm -it -p 8080:2015 -v "$${PWD}:/srv:delegated" ${DOCKER_IMAGE}:${DOCKER_TAG}

VERSION:=$(shell cat VERSION)

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
