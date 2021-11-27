FROM debian:buster

RUN apt-get update -y

RUN apt-get install -y tar wget git

COPY installers /builder/installers
RUN chmod -R +x /builder/installers

RUN /builder/installers/install-java-8.sh

RUN /builder/installers/install-maven.sh

RUN apt-get install -y autoconf libtool

RUN apt-get install -y ruby ruby-dev
RUN gem install fpm

RUN apt-get -y install build-essential python2-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules libapr1-dev libsvn-dev zlib1g-dev iputils-ping

COPY mesos-deb-packaging /builder/mesos-deb-packaging
COPY mesos-repo /builder/mesos-deb-packaging/mesos-repo

COPY scripts /builder/scripts
RUN chmod -R +x /builder/scripts

RUN /builder/scripts/build-mesos-buster.sh
