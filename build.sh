#!/bin/bash

set -e
set -x

TMUX_VERSION=3.1c
NCURSES_VERSION=6.2
LIBEVENT_VERSION=release-2.1.12-stable

# based on: https://gist.github.com/pistol/5069697

# ncurses
mkdir ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$NCURSES_VERSION.tar.gz -O - | tar xvzf - --strip-components 1 -C ncurses
cd ncurses
./configure --prefix=$HOME/local
make -j8
make install
cd ..

# libevent
git clone --depth 1 -b release-2.1.12-stable https://github.com/libevent/libevent.git
cd libevent
./autogen.sh
./configure --prefix=$HOME/local
make -j8
make install
cd ..

# tmux
git clone --depth 1 -b $VERSION https://github.com/tmux/tmux.git tmux-src
cd tmux-src
./autogen.sh
./configure --prefix=$HOME/local CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib"
make -j8
make install

cp tmux ..
