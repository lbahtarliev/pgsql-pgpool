#!/bin/bash

clear
echo "Fixing permissions for PGPool Admin GUI to run as postgres user... ";
sleep 1
echo "";
chown postgres:postgres -Rv /var/lib/pgsql/
chown root:postgres -v /var/lib/php/session/
chown postgres:postgres -v /var/lib/php/session/*
chown root:postgres -v /var/run/httpd/
chown postgres:postgres -Rv /var/run/httpd/htcacheclean/
chown postgres:postgres -Rv /var/run/pgpool-II-10/
chown postgres:postgres -Rv /etc/pgpoolAdmin/
chown postgres:postgres -Rv /var/lib/php
sleep 1
find /usr/share/pgpoolAdmin/ -user apache -group apache -exec chown -v postgres:postgres {} \;

echo "Done!";

exit 0
