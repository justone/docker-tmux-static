FROM docker.io/debian:bullseye-slim

MAINTAINER Nate Jones <nate@endot.org>
MAINTAINER Simske <mail@simske.com>

ENV TMUX_VERSION=3.2a \
    NCURSES_VERSION=6.3 \
    LIBEVENT_VERSION=release-2.1.12-stable

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget \
        g++ gcc git automake autoconf libtool pkg-config libssl-dev bison
RUN mkdir /tmux

ADD *.sh /tmux/
RUN chmod +x /tmux/*.sh

# Build ncurses
RUN /tmux/build-ncurses.sh

# Build libevent
RUN /tmux/build-libevent.sh

# Build
RUN /tmux/build-tmux.sh

# Copy build binary to /tmux/tmux
RUN cp /tmux/tmux-src/tmux /tmux/tmux
