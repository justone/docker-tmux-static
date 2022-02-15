#!/usr/bin/env bash

set -x -e

cd /tmux
mkdir ncurses
wget https://invisible-mirror.net/archives/ncurses/ncurses-${NCURSES_VERSION}.tar.gz -O - | tar xvzf - --strip-components 1 -C ncurses
cd ncurses
./configure --prefix=$HOME/local
make -j8
make install
