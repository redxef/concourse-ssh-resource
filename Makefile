SOURCES := $(shell cd ./src && find ./ -type f -and -not -name '*.vars')

shellcheck:
	cd ./src && shellcheck ${SOURCES}

.PHONY: shellcheck
