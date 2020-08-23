FROM ubuntu:latest

MAINTAINER Matthias Mursch<matthias.mursch@gmx.de>

USER root

RUN apt update \
    && DEBIAN_FRONTEND=nointeractive apt install -y \
    apt-utils \
    sudo \
    vim \
    git \
    git-gui \
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
