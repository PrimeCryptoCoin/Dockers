FROM ubuntu:22.04

LABEL maintainer="Asimov"
LABEL version="1.0.2"
LABEL description="Primeai node docker "

ARG DEBIAN_FRONTEND=nointeractive
RUN apt update

COPY ./node.sh /
RUN chmod 755 /node.sh

RUN apt install -y build-essential \
libssl-dev \
libboost-chrono-dev \
libboost-filesystem-dev \
libboost-program-options-dev \
libboost-system-dev \
libboost-thread-dev \
libboost-test-dev \
bison \
libexpat1-dev \
libdbus-1-dev \
libfontconfig-dev \
libfreetype6-dev \
libice-dev \
libsm-dev \
libx11-dev \
libxau-dev \
libxext-dev \
libevent-dev \
libxcb1-dev \
libxkbcommon-dev \
libminiupnpc-dev \
libprotobuf-dev \
libqrencode-dev \
xcb-proto \
x11proto-xext-dev \
x11proto-dev \
xtrans-dev \
zlib1g-dev \
libczmq-dev \
autoconf \
automake \
libtool \
protobuf-compiler \
git \
wget

WORKDIR /root

RUN git clone --branch 1.0.2 https://github.com/PrimeaiProject/Primeai.git
WORKDIR /root/Primeai

RUN ./autogen.sh

RUN contrib/install_db4.sh ../

RUN ./configure BDB_LIBS="-L/root/db4/lib -ldb_cxx-4.8" \BDB_CFLAGS="-I/root/db4/include" --prefix=/usr/local --disable-tests --disable-bench --with-gui=no -enable-cxx --disable-shared --with-pic

RUN make -j2
RUN make install

RUN rm /root/Primeai -R
RUN rm /root/db4 -R

RUN mkdir /data
VOLUME /data

EXPOSE 19000 19001

ENTRYPOINT ["/bin/sh", "-c" , "/node.sh"]