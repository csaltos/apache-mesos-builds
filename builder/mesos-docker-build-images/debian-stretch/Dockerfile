FROM debian:stretch

RUN apt-get update -y

RUN apt-get install -y tar wget git

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y autoconf libtool

RUN apt-get -y install build-essential python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping

RUN wget https://dlcdn.apache.org/mesos/1.11.0/mesos-1.11.0.tar.gz

RUN tar xzf mesos-1.11.0.tar.gz

RUN wget https://dlcdn.apache.org/mesos/1.10.0/mesos-1.10.0.tar.gz

RUN tar xzf mesos-1.10.0.tar.gz

RUN git clone https://gitbox.apache.org/repos/asf/mesos.git
