SHELL=bash

BINPATH ?= build

BUILD_TIME=$(shell date +%s)
GIT_COMMIT=$(shell git rev-parse HEAD)
VERSION ?= $(shell git tag --points-at HEAD | grep ^v | head -n 1)

.PHONY: all
all: audit test build

.PHONY: audit
audit:
	dis-vulncheck

.PHONY: build
build: 
	go build ./...

.PHONY: test
test: 
	go test -race -cover 

.PHONY: lint
lint:
	golangci-lint run ./...
