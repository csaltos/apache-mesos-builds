FROM debian:buster

RUN apt-get update -y

RUN apt-get install -y tar wget git

RUN apt-get install -y autoconf libtool

RUN apt-get install -y ruby ruby-dev
RUN gem install fpm

RUN apt-get -y install build-essential python2-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules libapr1-dev libsvn-dev zlib1g-dev iputils-ping

COPY mesos-deb-packaging /builder/mesos-deb-packaging
COPY mesos-repo /builder/mesos-deb-packaging/mesos-repo

COPY scripts /builder/scripts
RUN chmod -R +x /builder/scripts

RUN /builder/config-builder.sh

RUN /builder/scripts/install-java-8.sh

RUN /builder/scripts/install-maven.sh

RUN /builder/scripts/build-mesos-buster.sh
