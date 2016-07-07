#!/bin/bash

# cannot use below line
#set -e

export DPDK_DIR="/home/tan/git/dpdk-vhost/"
export DPDK_BUILD="$DPDK_DIR/x86_64-native-linuxapp-gcc"

if [ "$1"x = "debugx" ]; then
export EXTRA_CFLAGS='-O0 -g'
else
export EXTRA_CFLAGS=''
fi

cd $DPDK_DIR

bash make.sh

cd -

make clean

./boot.sh

if [ "$1"x = "debugx" ]; then
CFLAGS='-march=native -g -O0' ./configure --with-dpdk=$DPDK_BUILD
else
CFLAGS='-march-native' ./configure --with-dpdk=$DPDK_BUILD
fi

make -j

make install -j
