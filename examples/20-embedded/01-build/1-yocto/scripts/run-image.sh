#!/usr/bin/env bash

mkdir -p ./yocto-ruby

docker run -it --rm \
  -v "$PWD":/home/yocto/work/ \
  yocto-ruby \
  bash
