FROM ubuntu:xenial
MAINTAINER muabnesor <adam.rosenbaum@umu.se>

LABEL description="Image for STAR aligner version 2.7.3a"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    bzip2 \
    cmake \
    default-jdk \
    git \
    libnss-sss \
    libtbb2 \
    libtbb-dev \
    ncurses-dev \
    python-dev \
    python-pip \
    tzdata \
    unzip \
    wget \
    zlib1g \
    zlib1g-dev

# Star aligner 
ENV STAR_VERSION 2.7.3a
WORKDIR /docker_main
ADD https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz /usr/bin/
RUN tar -xzf /usr/bin/${STAR_VERSION}.tar.gz -C /usr/bin/
RUN cp /usr/bin/STAR-${STAR_VERSION}/bin/Linux_x86_64/* /usr/local/bin

RUN cd /docker_main / && \
   rm -rf ${STAR_VERSION}.tar.gz && \
   apt-get autoremove -y && \
   apt-get autoclean -y  && \
   apt-get clean

# Set default working path
WORKDIR /docker_main
