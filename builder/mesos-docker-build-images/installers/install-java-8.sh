#!/bin/bash -e

JAVA_DOWNLOAD_URL=https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
wget -q $JAVA_DOWNLOAD_URL -O /tmp/java.tar.gz

mkdir -p /opt/java
tar xzf /tmp/java.tar.gz -C /opt/java --strip-components=1

cat > /etc/profile.d/java.sh << EOF
JAVA_HOME=/opt/java
export JAVA_HOME
PATH=\$JAVA_HOME/bin:\$PATH
export PATH
EOF
