#!/bin/bash

yum -y install open-vm-tools \
			openssh-server \
			binutils \
			nano \
			curl \
			wget \
			bind-utils \
			git \
			lynx \
			net-tools \
			psutils \
			psmisc \
			httpd \
			php-process \
			rsync

yum -y install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
yum -y install http://www.pgpool.net/yum/rpms/4.0/redhat/rhel-7-x86_64/pgpool-II-release-4.0-1.noarch.rpm

yum -y install postgresql10-server.x86_64 \
			postgresql10.x86_64 \
			postgresql10-libs.x86_64 \
			postgresql10-contrib.x86_64 \
			pgpool-II-10-extensions \
			pgpool-II-pg10-devel.x86_64 \
			pgpoolAdmin.noarch
