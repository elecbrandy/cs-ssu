FROM ubuntu:22.04

RUN apt update && apt install -y \
    build-essential \
    gcc-arm-linux-gnueabihf \
    gdb-multiarch \
    qemu-user \
    qemu-user-static \
    vim \
    git \
    && apt clean

WORKDIR /root/cs-ssu/templates
