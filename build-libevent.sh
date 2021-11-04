#!/usr/bin/env bash

set -e -x

cd /tmux
git clone --depth 1 -b $LIBEVENT_VERSION https://github.com/libevent/libevent.git
cd libevent
./autogen.sh
./configure --prefix=$HOME/local
make -j8
make install
