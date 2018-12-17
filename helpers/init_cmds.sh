#!/bin/bash
# Add postgres/wheel group with access to /usr/sbin/ip, /usr/sbin/arping, /usr/sbin/ifconfig with NOPASSWD
visudo 
# Init PostgreSQL database data directory
/usr/pgsql-10/bin/initdb --no-locale -E UTF_8 --data-checksums --pgdata /var/lib/pgsql/10/data/
# Set postgres user password, to be able to generate and copy ssh keys for passwordless login on machines.
passwd postgres
ssh-keygen
ssh-copy-id postgres@1.2.3.4
# Restore SELinux Security Contexts in case of ssh-copy-id error/not-working
/usr/sbin/restorecon -Rv ~/.ssh
