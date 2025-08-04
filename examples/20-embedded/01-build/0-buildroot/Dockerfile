FROM debian:bookworm

RUN apt-get update && apt-get install -y \
  build-essential \
  git wget curl unzip bc \
  python3 g++ make libncurses-dev flex bison \
  qemu-system-arm \
  rsync file cpio \
  tar gzip xz-utils patch \
  sudo gawk \
  libssl-dev \
  && apt-get clean

WORKDIR /work
RUN git clone https://github.com/buildroot/buildroot.git

ENV FORCE_UNSAFE_CONFIGURE=1

WORKDIR /work/buildroot

COPY scripts/configure-buildroot-for-ruby.sh .
