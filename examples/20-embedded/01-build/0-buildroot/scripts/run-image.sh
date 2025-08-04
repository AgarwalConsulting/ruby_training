#!/usr/bin/env bash

# docker run -it --rm -v `pwd`/output:/work/buildroot/output buildroot-simple

# docker volume create br-output
# docker run -it --rm -v br-output:/work/buildroot/output buildroot-simple

docker run -it --name br-ruby buildroot-simple

rm -rf output

docker cp br-ruby:/work/buildroot/output .

# docker rm br-ruby
