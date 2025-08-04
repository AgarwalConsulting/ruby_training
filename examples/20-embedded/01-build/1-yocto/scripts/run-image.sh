#!/usr/bin/env bash

mkdir -p ./yocto-ruby

docker run -it --rm \
  -v "$PWD":/work \
  yocto-ruby \
  bash
