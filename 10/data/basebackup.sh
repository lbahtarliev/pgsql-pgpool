#! /bin/sh
psql=/usr/pgsql-10/bin/psql
pg_rewind=/usr/pgsql-10/bin/pg_rewind
DATADIR_BASE=/var/lib/pgsql/10
PGSUPERUSER=postgres

SRC_CLUSTER=$1
recovery_hostname=$2
DEST_CLUSTER=$3
PORT=$4
recovery_id=$5
#master_hostname=$(grep $(hostname) /etc/hosts | awk '{print $1}')
master_hostname=$($DATADIR_BASE/sbin/ifconfig ens192 | grep "inet " | awk '{print $2}')
log=$DATADIR_BASE/log/recovery.log

echo >> $log
date >> $log
echo "$0: $@" >> $log

$psql -p $PORT -c "SELECT pg_start_backup('Streaming Replication', true)" postgres

echo "source: $SRC_CLUSTER dest: $PGSUPERUSER@$remote_hostname:$DEST_CLUSTER" >> $log

rsync -C -a -c --delete \
	-e 'ssh -o "VerifyHostKeyDNS no" -o "StrictHostKeyChecking no"' \
	--exclude postgresql.conf --exclude postmaster.pid \
	--exclude postmaster.opts --exclude pg_log \
	--exclude recovery.conf --exclude recovery.done \
	--exclude pg_xlog --exclude log \
	$SRC_CLUSTER/ $recovery_hostname:$DEST_CLUSTER/

ssh -T postgres@$recovery_hostname "
	rm -frv $DEST_CLUSTER/pg_xlog && \
	mkdir $DEST_CLUSTER/pg_xlog && \
	chmod 700 $DEST_CLUSTER/pg_xlog && \
	rm -v $DEST_CLUSTER/recovery.done
"

$psql -p $PORT -c "SELECT * FROM pg_create_physical_replication_slot('pgpool_slot$recovery_id')" postgres

ssh -T postgres@$recovery_hostname "
cat > $DEST_CLUSTER/recovery.conf <<REOF
standby_mode          = 'on'
primary_conninfo      = 'host=$master_hostname port=$PORT user=$PGSUPERUSER'
recovery_target_timeline='latest'
primary_slot_name = 'pgpool_slot$recovery_id'
REOF
"

$psql -p $PORT -c "SELECT pg_stop_backup()" postgres
