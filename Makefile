SOURCES := $(shell find ./src -type f -and -not -name '*.vars')
SOURCES_REL := $(shell cd ./src && find ./ -type f -and -not -name '*.vars')

build: artifacts/docker-marker

shellcheck: artifacts/shellcheck-log

artifacts/shellcheck-log: ${SOURCES} artifacts
	cd ./src && shellcheck ${SOURCES_REL} > ../artifacts/shellcheck-log

artifacts:
	mkdir -p artifacts

artifacts/docker-marker: Dockerfile ${SOURCES} artifacts/shellcheck-log
	docker build -t redxef/concourse-ssh-resource .
	touch artifacts/docker-marker

