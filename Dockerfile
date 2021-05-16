FROM ubuntu:20.04

MAINTAINER Matthias Mursch<matthias.mursch@gmx.de>

USER root

RUN apt update \
    && DEBIAN_FRONTEND=nointeractive apt install -y \
    apt-utils \
    sudo \
    vim \
    git \
    git-gui \
    make=4.2.1-1.2 \
    python3=3.8.2-0ubuntu2 \
    gcc-avr=1:5.4.0+Atmel3.6.1-2build1 \
    avr-libc=1:2.0.0+Atmel3.6.1-2 \
    avrdude \
    bc bison flex libssl-dev libc6-dev libncurses5-dev \
    crossbuild-essential-armhf \
    crossbuild-essential-arm64 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i 's/docker:x999/docker:x:998:/g' /etc/group \
  && useradd -u 1000 -G users,sudo,dialout -ms /bin/bash docker \
  && echo "docker:docker" | chpasswd

RUN USER=docker && \
    GROUP=docker

USER docker:docker
WORKDIR /home/docker
ENV DISPLAY :0

#ENTRYPOINT ["fixuid", "-q"]
