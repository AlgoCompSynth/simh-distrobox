FROM docker.io/library/ubuntu:noble
LABEL MAINTAINER="M. Edward (Ed) Borasky <znmeb@algocompsynth.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LOGFILE=/usr/local/src/logs/debug.log
RUN mkdir --parents /usr/local/src/logs \
  && rm --force $LOGFILE
RUN apt-get update \
  >> $LOGFILE 2>&1 \
  && apt-get install -qqy --no-install-recommends \
  apt-file \
  build-essential \
  cmake \
  curl \
  git \
  ninja-build \
  plocate \
  sudo \
  time \
  unzip \
  vim \
  wget \
  >> $LOGFILE 2>&1

WORKDIR /usr/local/src/simh/
COPY simh/ /usr/local/src/simh/
RUN sh .travis/deps.sh linux \
  >> $LOGFILE 2>&1 \
  && cmake/cmake-builder.sh --flavor ninja --config Debug \
  >> $LOGFILE 2>&1
RUN apt-file update \
  >> $LOGFILE 2>&1 \
  &&  updatedb \
  >> $LOGFILE 2>&1
