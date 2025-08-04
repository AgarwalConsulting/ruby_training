FROM debian:bookworm

RUN apt-get update && apt-get install -y \
  gawk wget git diffstat unzip texinfo gcc \
  build-essential chrpath socat cpio python3 \
  python3-pip python3-pexpect xz-utils debianutils \
  iputils-ping python3-git python3-jinja2 libegl1-mesa \
  libsdl1.2-dev xterm zstd qemu-system-arm locales \
  && apt-get clean

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /work
