
FROM ubuntu:xenial

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -yq install apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    autoconf-archive \
    bison \
    build-essential \
    cmake \
    curl \
    flex \
    git \
    gradle \
    gperf \
    joe \
    libboost-all-dev \
    libcap-dev \
    libdouble-conversion-dev \
    libevent-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libkrb5-dev libnuma-dev \
    libsasl2-dev libsnappy-dev \
    libsqlite3-dev \
    libssl-dev libtool \
    netcat-openbsd \
    openssl \
    pkg-config \
    sudo \
    unzip \
    wget

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq gcc-'5' g++-'5'
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-'5' 40 --slave /usr/bin/g++ g++ /usr/bin/g++-'5'
RUN update-alternatives --config gcc

RUN DEBIAN_FRONTEND=noninteractive apt-get install libcurl4-openssl-dev

# These packages were painstakingly found to be needed without documentation.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    libglapi-mesa \
    libxdamage1 \
    libxfixes3 \
    libx11-xcb-dev \
    libxcb-glx0 \
    libxcb-dri2-0 \
    libxxf86vm1 \
    libdrm2

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    libglu1-mesa \
    freeglut3-dev \
    mesa-common-dev \
    xorg-dev \
    x11proto-randr-dev

COPY . /tangram-es
WORKDIR /tangram-es

CMD [ "./scripts/build_and_test.sh" ]
