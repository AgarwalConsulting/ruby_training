#!/usr/bin/env bash

qemu-system-arm \
  -M vexpress-a9 \
  -m 256M \
  -nographic \
  -kernel ruby-arm-zImage \
  -dtb vexpress-v2p-ca9.dtb \
  -drive file=ruby-arm-rootfs.img,format=raw,if=sd \
  -append "root=/dev/mmcblk0 console=ttyAMA0"
