FROM debian:buster-slim
MAINTAINER lll9p <lll9p.china@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update  \
    && apt-get install -y --no-install-recommends locales \
    && apt-get install -y --no-install-recommends unzip libtool-bin curl cmake gperf gawk flex bison nano xxd \
    fakeroot kmod cpio git python3-docutils gettext automake autopoint \
    texinfo build-essential help2man pkg-config zlib1g-dev libgmp3-dev \
    libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev wget libc-dev-bin \
    proxychains4 sudo vim \
    && groupadd -r build && useradd -r -u 1000 -g build build \
    && echo '%build ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && apt-get -y purge manpages xauth \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

USER build
WORKDIR /home/build

ENV FORCE_UNSAFE_CONFIGURE=1

CMD ["/bin/bash"]
