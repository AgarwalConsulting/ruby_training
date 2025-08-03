#!/usr/bin/env bash

gcc ruby_in.c -o ruby_in \
  -I/usr/local/var/rbenv/versions/mruby-3.4.0/include \
  -L/usr/local/var/rbenv/versions/mruby-3.4.0/lib \
  -lmruby
