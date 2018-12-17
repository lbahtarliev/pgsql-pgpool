#!/bin/bash

yum -q -y erase postgresql10-server.x86_64 \
	postgresql10.x86_64 \
	postgresql10-libs.x86_64 \
	postgresql10-contrib.x86_64 \
	pgpool-II-pg10.x86_64 \
	pgpool-II-10-extensions \
	pgpool-II-10-devel.x86_64 \
	pgpool-II-pg10-devel.x86_64 \
	pgpoolAdmin.noarch
