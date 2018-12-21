#!/bin/bash

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum install yum-utils

yum updateinfo
yum makecache

#yum-config-manager --enable remi-php55   # [Install PHP 5.5]
yum-config-manager --enable remi-php56   # [Install PHP 5.6]
#yum-config-manager --enable remi-php72   # [Install PHP 7.2]
#yum-config-manager --enable remi-php56   # [Install PHP 5.6]

yum -y install php \
               php-mcrypt \
               php-cli \
               php-gd \
               php-curl \
               php-mysql \
               php-ldap \
               php-zip \
               php-fileinfo

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
