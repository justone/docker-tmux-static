from docker.io/debian:buster

maintainer Nate Jones <nate@endot.org>

run apt-get update
run DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget \
                                              g++ gcc git automake autoconf \
                                              libtool pkg-config openssl
run mkdir /tmux

add build.sh /tmux/build.sh
run bash -c "cd /tmux; chmod +x build.sh; bash ./build.sh"
