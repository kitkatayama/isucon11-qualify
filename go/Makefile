SRC:=$(shell find . -type f -name '*.go' -not -path 'vendor/*')


.PHONY: all
all: build ;

.PHONY: build
build: isucondition

isucondition: ${SRC}
	@go build -o isucondition main.go

