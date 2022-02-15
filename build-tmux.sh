#!/usr/bin/env bash

set -e -x

cd /tmux

git clone --depth 1 -b $TMUX_VERSION https://github.com/tmux/tmux.git tmux-src
cd tmux-src
./autogen.sh
./configure --prefix=$HOME/local CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" \
    LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib"
make -j8
make install
