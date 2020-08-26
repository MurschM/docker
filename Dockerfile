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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#FROM microsoft/windowsservercore:latest
# Create Windows user in the container
#RUN net user /add docker
# Set it for subsequent commands
#USER docker:docker


RUN useradd -ms /bin/bash -u 1000 docker 
USER docker:docker
WORKDIR /home/docker
ENV DISPLAY :0

#ENTRYPOINT ["fixuid", "-q"]
