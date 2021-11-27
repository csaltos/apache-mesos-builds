#!/bin/bash -e

BASE_DIR=$(dirname $0)

BUILD_IMAGE_NAME=debian-buster
MESOS_VERSION=HEAD

CACHE_BASE=$BASE_DIR/cache
CACHE_MESOS_REPO=$CACHE_BASE/mesos

mkdir -p $CACHE_BASE
if [[ ! -d $CACHE_MESOS_REPO ]]; then
    git -C $CACHE_BASE clone https://gitbox.apache.org/repos/asf/mesos.git
fi
git -C $CACHE_MESOS_REPO pull

BUILDER_BASE=$BASE_DIR/builder
BUILDER_IMAGE_BASE=$BUILDER_BASE/mesos-docker-build-images
BUILDER_IMAGE=$BUILDER_IMAGE_BASE/$BUILD_IMAGE_NAME
BUILDER_INSTALLERS=$BUILDER_IMAGE_BASE/installers
BUILDER_SCRIPTS=$BUILDER_IMAGE/scripts

TARGET_BASE=$BASE_DIR/target
TARGET_IMAGE=$TARGET_BASE/$BUILD_IMAGE_NAME
TARGET_MESOS_REPO=$TARGET_IMAGE/mesos-repo

OUTPUT=$BASE_DIR/output
OUTPUT_PACKAGE=$OUTPUT/mesos-$MESOS_LABEL_VERSION-$BUILD_IMAGE_NAME.deb

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
    git -C $TARGET_MESOS_REPO checkout $MESOS_VERSION
fi

MESOS_LABEL_VERSION=$(grep "AC_INIT..mesos.," $TARGET_MESOS_REPO/configure.ac | sed "s/[^0-9.]//g")

docker build -t mesos-build-$BUILD_IMAGE_NAME $TARGET_IMAGE

docker run -it mesos-build-debian-buster:latest cat /builder/mesos-deb-packaging/pkg.deb > $OUTPUT_PACKAGE

echo "Apache Mesos $MESOS_LABEL_VERSION is at $OUTPUT_PACKAGE"
