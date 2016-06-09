FROM ubuntu:latest

MAINTAINER gennadiy.dubina <gennadiy.dubina@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  libpcap-dev \
  libsctp-dev \
  libncurses5-dev \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/SIPp/sipp/releases/download/v3.5.0/sipp-3.5.0.tar.gz /
RUN tar -xzf /sipp-3.5.0.tar.gz

WORKDIR /sipp-3.5.0
RUN ./configure --with-pcap --with-sctp --with-openssl --with-rtpstream && make install

WORKDIR /
RUN rm -rf sipp-3.5.0.tar.gz sipp-3.5.0

CMD sipp
