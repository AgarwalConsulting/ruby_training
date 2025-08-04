#!/usr/bin/env bash

rm -rf output/
mkdir -p output/images

# docker cp br-ruby:/work/buildroot/output .

docker cp br-ruby:/work/buildroot/output/images/rootfs.ext2 ruby-arm-rootfs.img
docker cp br-ruby:/work/buildroot/output/images/zImage ruby-arm-zImage
docker cp br-ruby:/work/buildroot/output/images/vexpress-v2p-ca9.dtb vexpress-v2p-ca9.dtb
