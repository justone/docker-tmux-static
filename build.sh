#!/bin/bash

set -e
set -x

VERSION=1.8

wget -O tmux-$VERSION.tar.gz http://sourceforge.net/projects/tmux/files/tmux/tmux-$VERSION/tmux-$VERSION.tar.gz/download
tar xzvf tmux-$VERSION.tar.gz
cd tmux-$VERSION

LDFLAGS="-static -static-libgcc" LIBS="-ltinfo" ./configure --enable-static
LDFLAGS="-static -static-libgcc" make

cp tmux ..
