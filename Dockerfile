FROM ubuntu:20.04

MAINTAINER MurschM

USER root

RUN apt update \
    && DEBIAN_FRONTEND=nointeractive apt install -y \
    apt-utils \
    sudo \
    udev \
    vim \
    curl \
    git \
    git-gui \
    make=4.2.1-1.2 \
    cmake=3.22.0 \
    python3=3.8.2-0ubuntu2 \
    python3-pip \
    python \
    python-tk \
    gcc-avr=1:5.4.0+Atmel3.6.1-2build1 \
    avr-libc=1:2.0.0+Atmel3.6.1-2 \
    avrdude \
    bc bison flex libssl-dev libc6-dev libncurses5-dev \
    crossbuild-essential-armhf \
    crossbuild-essential-arm64 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L -o usbasp.2011-05-28.tar.gz http://www.fischl.de/usbasp/usbasp.2011-05-28.tar.gz \
    && tar -xvzf usbasp.2011-05-28.tar.gz \
    && sudo cp ./usbasp.2011-05-28/bin/linux-nonroot/99-USBasp.rules /etc/udev/rules.d/99-USBasp.rules
#RUN rm -rf ./usbasp
#RUN rm -rf ./usbasp.*

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py \
    && python2 get-pip.py \
    && rm get-pip.py \
    && python -m pip install pyserial

RUN sed -i 's/docker:x999/docker:x:998:/g' /etc/group \
  && useradd -u 1000 -G users,sudo,dialout -ms /bin/bash docker \
  && echo "docker:docker" | chpasswd

RUN USER=docker && \
    GROUP=docker

USER docker:docker
WORKDIR /home/docker
ENV DISPLAY :0

#ENTRYPOINT ["fixuid", "-q"]
