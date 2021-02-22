FROM alpine:latest
MAINTAINER lll9p <lll9p.china@gmail.com>

ENV LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_CTYPE=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8

RUN \
        apk add --update --no-cache \
        make gcc g++ cpio curl wget nano xxd kmod \
        pkgconfig rpcgen fakeroot ncurses bash patch \
        bsd-compat-headers python2 python3 zlib-dev \
        automake gettext gettext-dev autoconf bison \
        flex coreutils cmake git libtool gawk sudo \
        && rm -rf /var/cache/apk/* \
        && git config --global user.email '<>' \
        && git config --global user.name 'lll9p'\
        && addgroup -S build && adduser -S build -G build -u 1000 \
        && echo '%build ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
        && git config --global user.email '<>' \
        && rm -rf /var/cache/apk/*

USER build
WORKDIR /home/build

CMD ["/bin/bash"]
