#!/bin/bash
set -x
export PGPOOL_INSTALL_DIR="/usr"
export PGBIN="/usr/pgsql-10/bin"
export PGLIB="/usr/pgsql-10/lib"
export PGSOCKET_DIR="/var/run/postgresql"
export USE_REPLICATION_SLOT="true"
export USE_PG_REWIND="false"

/usr/pgpool-10/bin/pgpool_setup $@
