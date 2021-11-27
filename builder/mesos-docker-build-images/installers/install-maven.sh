#!/bin/bash -e

MAVEN_DOWNLOAD_URL=https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
wget $MAVEN_DOWNLOAD_URL -O /tmp/maven.tar.gz

mkdir -p /opt/maven
tar xzf /tmp/maven.tar.gz -C /opt/maven --strip-components=1

cat > /etc/profile.d/maven.sh << EOF
MAVEN_HOME=/opt/maven
export MAVEN_HOME
PATH=\$MAVEN_HOME/bin:\$PATH
export PATH
EOF
