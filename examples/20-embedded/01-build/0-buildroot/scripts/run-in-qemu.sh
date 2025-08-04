#!/usr/bin/env bash

qemu-system-arm \
  -M vexpress-a9 \
  -m 256M \
  -nographic \
  -kernel output/images/zImage \
  -dtb output/images/vexpress-v2p-ca9.dtb \
  -drive file=output/images/rootfs.ext2,format=raw,if=sd \
  -append "root=/dev/mmcblk0 console=ttyAMA0"
