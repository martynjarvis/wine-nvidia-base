FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common

RUN dpkg --add-architecture i386 && \
    add-apt-repository ppa:graphics-drivers/ppa && \
    add-apt-repository ppa:ubuntu-wine/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends wine1.7 && \
    apt-get install -y --no-install-recommends nvidia-361 && \
    apt-get autoremove -y --purge software-properties-common && \
    apt-get autoremove -y --purge && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash gaming
USER gaming
WORKDIR /home/gaming
ENV HOME /home/gaming
RUN wine wineboot --init
