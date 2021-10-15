# Makefile to build the given image
.DEFAULT_GOAL := build

DOCKER_IMAGE_VERSION ?= s1.0.1

apache-ubuntu1804:
	packer build -var-file=./vars/apache-ubuntu1804.vars.json -var "docker_image_version=$(DOCKER_IMAGE_VERSION)" genericbuild-moodle.json

phpfpm-ubuntu1804:
	packer build -var-file=./vars/phpfpm-ubuntu1804.vars.json -var "docker_image_version=$(DOCKER_IMAGE_VERSION)" genericbuild-moodle.json

build: apache-ubuntu1804 phpfpm-ubuntu1804

push:
	for IMAGE in `docker image ls --filter "reference=calllearning/ubuntu-*:$(DOCKER_IMAGE_VERSION)"  --format "{{.Repository}}:{{.Tag}}"`; \
	do \
		echo Pushing to: $$IMAGE; \
		docker tag $$IMAGE $$IMAGE; \
		docker push $$IMAGE; \
	done
