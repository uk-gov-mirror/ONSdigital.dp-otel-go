#!/bin/bash -eux

cwd=$(pwd)

pushd $cwd/dp-otel-go
  make lint
popd
