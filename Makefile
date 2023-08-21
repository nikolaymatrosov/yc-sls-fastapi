REVISION := $(shell git rev-parse --short HEAD)
DOCKER_IMAGE_NAME = cr.yandex/your_cr_id/fastapi:$(REVISION)

build:
	docker build --platform linux/amd64 -t $(DOCKER_IMAGE_NAME) .

push:
	docker push $(DOCKER_IMAGE_NAME)

run:
	docker run --rm --platform linux/amd64 -e PORT=8080 -p8080:8080  $(DOCKER_IMAGE_NAME)