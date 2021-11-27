#!/bin/bash -e

source /etc/profile

export MAINTAINER=dev@csaltos.com

AVILABLE_CPUS=$(lscpu | grep "^CPU(s):" | cut -d ':' -f 2 | sed 's/ //g')
if [[ -z $AVILABLE_CPUS ]]; then
    AVILABLE_CPUS=1
fi
export MAKEFLAGS=-j$AVILABLE_CPUS

cd /builder/mesos-deb-packaging

./build_mesos
