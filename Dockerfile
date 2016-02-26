FROM ubuntu:latest
MAINTAINER = Jason M. Mills <jmmills@cpan.org>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y build-essential

ADD https://github.com/SIPp/sipp/releases/download/v3.5.0/sipp-3.5.0.tar.gz
RUN tar -xzf /sipp-3.5.0.gz

RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcap-dev
RUN apt-get install -y libsctp-dev
RUN apt-get install -y libncurses5-dev

WORKDIR /sipp-3.5.0
RUN ./configure --with-pcap --with-sctp --with-openssl --with-rtpstream
RUN make install

WORKDIR /
RUN rm -rf v3.5.0.tar
RUN rm -rf sipp-3.5.0

CMD sipp
