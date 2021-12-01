FROM centos:8

RUN yum install -y tar wget git

COPY installers /builder/installers
RUN chmod -R +x /builder/installers

RUN /builder/installers/install-java-8.sh

RUN /builder/installers/install-maven.sh

RUN yum groupinstall -y "Development Tools"

RUN yum install -y python2-devel python2-six python2-virtualenv zlib-devel libcurl-devel openssl-devel cyrus-sasl-devel cyrus-sasl-md5 apr-devel subversion-devel apr-util-devel

RUN yum install -y ruby ruby-devel
RUN gem install fpm

COPY mesos-deb-packaging /builder/mesos-deb-packaging
COPY mesos-repo /builder/mesos-deb-packaging/mesos-repo

COPY scripts /builder/scripts
RUN chmod -R +x /builder/scripts

RUN /builder/scripts/build-mesos-centos-8.sh
