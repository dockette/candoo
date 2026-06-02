IMAGE ?= dockette/candoo
TAG ?= latest

.PHONY: build test run

build:
	docker build -t $(IMAGE):$(TAG) .

test:
	docker run --rm $(IMAGE):$(TAG) php -v
	docker run --rm $(IMAGE):$(TAG) caddy -version

run:
	docker run --rm -it -p 8080:2015 -v $(PWD):/srv:delegated $(IMAGE):$(TAG)
