#!/bin/bash -e

AVILABLE_CPUS=$(lscpu | grep "^CPU(s):" | cut -d ':' -f 2 | sed 's/ //g')

if [[ -z $AVILABLE_CPUS ]]; then
    AVILABLE_CPUS=1
fi

cat > /etc/profile.d/builder.sh << EOF
MAINTAINER=dev@csaltos.com
export MAINTAINER
MAKEFLAGS=-j$AVILABLE_CPUS
export MAKEFLAGS
EOF