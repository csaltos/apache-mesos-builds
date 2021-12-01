FROM debian:stretch

RUN apt-get update -y

RUN apt-get install -y tar wget git

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y autoconf libtool

RUN apt-get install -y ruby ruby-dev
RUN gem install fpm

RUN apt-get -y install build-essential python-dev python-six python-virtualenv libcurl4-openssl-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping

COPY mesos-deb-packaging /builder/mesos-deb-packaging
COPY mesos-repo /builder/mesos-deb-packaging/mesos-repo

COPY scripts /builder/scripts
RUN chmod -R +x /builder/scripts

RUN /builder/scripts/build-mesos-stretch.sh
