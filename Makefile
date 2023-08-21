REVISION := $(shell git rev-parse --short HEAD)
DOCKER_IMAGE_NAME = cr.yandex/your_cr_id/fatsapi:$(REVISION)

build:
	docker build --platform linux/amd64 -t $(DOCKER_IMAGE_NAME) .

push:
	docker push $(DOCKER_IMAGE_NAME)