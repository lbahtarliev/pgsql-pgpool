#! /bin/sh
# Execute command by failover.
# special values:  %d = node id
#                  %h = host name
#                  %p = port number
#                  %D = database cluster path
#                  %m = new master node id
#                  %M = old master node id
#                  %H = new master node host name
#                  %P = old primary node id
#                  %R = new master database cluster path
#                  %r = new master port number
#                  %% = '%' character
failed_node_id=$1
failed_host_name=$2
failed_port=$3
failed_db_cluster=$4
new_master_id=$5
old_master_id=$6
new_master_host_name=$7
old_primary_node_id=$8
new_master_port_number=$9
new_master_db_cluster=${10}
psql=/bin/psql
pg_ctl=/usr/pgsql-10/bin/pg_ctl
mydir=/var/lib/pgsql/10
log=$mydir/log/failover.log
old_replication_slot="pgpool_slot$new_master_id"

echo >> $log
date >> $log
echo "$0: $@" >> $log
echo "------------------------------------------------------------------------------------------------------------------------" >> $log
echo "failed_node_id $failed_node_id failed_host_name $failed_host_name failed_port $failed_port failed_db_cluster $failed_db_cluster \
new_master_id $new_master_id old_master_id $old_master_id new_master_host_name $new_master_host_name old_primary_node_id $old_primary_node_id \
new_master_port_number $new_master_port_number new_master_db_cluster $new_master_db_cluster" >> $log

if [ a"$failed_node_id" = a"$old_primary_node_id" ];then
	echo ssh -T postgres@$new_master_host_name -o "VerifyHostKeyDNS no" -o "StrictHostKeyChecking no" $pg_ctl -D $new_master_db_cluster promote >> $log
	ssh -T postgres@$new_master_host_name -o "VerifyHostKeyDNS no" -o "StrictHostKeyChecking no" $pg_ctl -D $new_master_db_cluster promote >> $log
	sleep 2
	$psql -h $new_master_host_name -p $new_master_port_number -c "SELECT * FROM pg_drop_replication_slot('${old_replication_slot}')" >> $log
fi
