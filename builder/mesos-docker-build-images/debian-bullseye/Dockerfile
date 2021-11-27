FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install -y tar wget git

RUN wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz -O jdk8.tar.gz

RUN tar xzf jdk8.tar.gz

RUN apt-get install -y autoconf libtool

RUN apt-get -y install build-essential python3-dev python-six python3-virtualenv python-dev-is-python3 libcurl4-nss-dev libsasl2-dev libsasl2-modules libapr1-dev libsvn-dev zlib1g-dev iputils-ping

RUN wget https://dlcdn.apache.org/mesos/1.11.0/mesos-1.11.0.tar.gz

RUN tar xzf mesos-1.11.0.tar.gz

RUN wget https://dlcdn.apache.org/mesos/1.10.0/mesos-1.10.0.tar.gz

RUN tar xzf mesos-1.10.0.tar.gz

RUN git clone https://gitbox.apache.org/repos/asf/mesos.git
