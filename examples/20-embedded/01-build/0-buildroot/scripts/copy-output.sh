#!/usr/bin/env bash

rm -rf output/

docker cp br-ruby:/work/buildroot/output .
