#!/bin/bash

set -e
set -x

VERSION=2.0

# based on: https://gist.github.com/pistol/5069697

# ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
tar xvzf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/local
make -j8
make install
cd ..

# libevent
git clone git://github.com/libevent/libevent.git
cd libevent
git checkout release-2.0.21-stable
./autogen.sh
./configure --prefix=$HOME/local
make -j8
make install
cd ..

# tmux
git clone https://github.com/tmux/tmux.git tmux-src
cd tmux-src
git checkout $VERSION
./autogen.sh
./configure --prefix=$HOME/local CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib"
make -j8
make install

cp tmux ..
