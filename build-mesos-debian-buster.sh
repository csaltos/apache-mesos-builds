#!/bin/bash -e

BUILD_IMAGE_NAME=debian-buster
MESOS_VERSION=HEAD

CACHE_BASE=$(dirname $0)/cache
CACHE_MESOS_REPO=$CACHE_BASE/mesos

if [[ ! -d $CACHE_MESOS_REPO ]]; then
    git -C $CACHE_BASE clone https://gitbox.apache.org/repos/asf/mesos.git
fi
git -C $CACHE_MESOS_REPO pull

BUILDER_BASE=$(dirname $0)/builder
BUILDER_IMAGE_BASE=$BUILDER_BASE/mesos-docker-build-images
BUILDER_IMAGE=$BUILDER_IMAGE_BASE/$BUILD_IMAGE_NAME
BUILDER_INSTALLERS=$BUILDER_IMAGE_BASE/installers
BUILDER_SCRIPTS=$BUILDER_IMAGE/scripts

TARGET_BASE=$(dirname $0)/target
TARGET_IMAGE=$TARGET_BASE/$BUILD_IMAGE_NAME
TARGET_MESOS_REPO=$TARGET_IMAGE/mesos-repo

rm -rf $TARGET_BASE
mkdir -p $TARGET_BASE

cp -a $BUILDER_IMAGE $TARGET_BASE
cp -a $BUILDER_INSTALLERS $TARGET_IMAGE
cp -a $BUILDER_SCRIPTS $TARGET_IMAGE
cp -a $BUILDER_BASE/mesos-deb-packaging $TARGET_IMAGE

cp -a $CACHE_MESOS_REPO $TARGET_MESOS_REPO

if [[ $MESOS_VERSION == HEAD ]]; then
    git -C $TARGET_MESOS_REPO checkout master
else
    git -C $TARGET_MESOS_REPO checkout tag/$MESOS_VERSION
fi

docker build -t mesos-build-$BUILD_IMAGE_NAME $TARGET_IMAGE

docker run -it mesos-build-debian-buster:latest cp /builder/mesos-deb-packaging/pkg.deb $TARGET/mesos-$MESOS_VERSION-$BUILD_IMAGE_NAME.deb
