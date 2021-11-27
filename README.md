# Mesos builds

## What?

Scripts and configuration to build Apache Mesos packages for Debian and soon for CentOs, Fedora, RedHat and Ubuntu using DEB and RPM files.

## Why?

Because I was not able to find the version build I need for my company and I'd like to share a possible solution.

## How ?

Ensure you have Docker installed and then clone this repo to run `build-mesos.sh`

> Currently it's only building Apache Mesos 1.12.0 head version for Debian Linux Buster 10 ... if you need more builds for other versions please let me know and I will try to do it

## Who ?

Thanks to the amazing people of Apache and the cool project Mesos.

Also thanks to DC/OS for providing the base of this builder at https://github.com/mesosphere/mesos-deb-packaging
