FROM ubuntu:latest

MAINTAINER jeferwang@qq.com

RUN mkdir -p /usr/local/src && \
    mkdir -p /root/.aria2/ && \
    touch /root/.aria2/aria2.session

WORKDIR /usr/local/src

RUN cp /etc/apt/sources.list /etc/apt/sources.list.back && \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update

RUN apt-get install -y wget \
    make \
    gcc \
    g++ \
    vim \
    nettle-dev \
    libgmp-dev \
    libssh2-1-dev \
    libc-ares-dev \
    libxml2-dev \
    zlib1g-dev \
    libsqlite3-dev \
    pkg-config \
    libgcrypt-dev \
    nettle-dev \
    libgmp-dev \
    libgpg-error-dev \
    libgcrypt-dev \
    libssl-dev \
    nettle-dev \
    libgmp-dev \
    libgpg-error-dev \
    libgcrypt-dev: \
    libssl-dev \
    libexpat1-dev \
    libxml2-dev \
    libexpat1-dev \
    libxml2-dev \
    libcppunit-dev \
    autoconf \
    automake \
    autotools-dev \
    autopoint \
    libtool


RUN export http_proxy=http://192.168.0.112:1080/ && export https_proxy=http://192.168.0.112:1080/ && wget 'https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.gz' && \
    tar -xvf ./aria2-1.35.0.tar.gz && \
    cd aria2-1.35.0 && \
    autoreconf -i && \
    ./configure --prefix=/usr/local && \
    make -j 8 && \
    make install

ADD ./aria2.conf  /root/.aria2/aria2.conf

ENTRYPOINT /usr/local/bin/aria2c






#kernel-devel
#libgcrypt-devel
#libxml2-devel
#openssl-devel
#gettext-devel
#libgnutls-dev
#libgnutls-dev
#cppunit
#nettle-dev
#libgmp-dev
#libssh2-1-dev
#libc-ares-dev
#libxml2-dev
#zlib1g-dev
#libsqlite3-dev
#pkg-config
#libgcrypt-dev
#nettle-dev
#libgmp-dev
#libgpg-error-dev
#libgcrypt-dev
#libssl-dev
#nettle-dev
#libgmp-dev
#libgpg-error-dev
#libgcrypt-dev:
#libssl-dev
#libexpat1-dev
#libxml2-dev
#libexpat1-dev
#gcc
#g++
#libxml2-dev
#libcppunit-dev
#autoconf
#automake
#autotools-dev
#autopoint
#libtool
