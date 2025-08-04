#!/usr/bin/env bash

mkdir -p output/

make qemu_arm_versatile_defconfig
make menuconfig

# Enable Ruby under:
  # Target packages  --->
  #   Interpreter languages  --->
  #     [*] ruby

make
